package com.example.juego_topos.model

import android.util.Log
import androidx.compose.runtime.getValue
import androidx.compose.runtime.mutableIntStateOf
import androidx.compose.runtime.mutableStateOf
import androidx.compose.runtime.setValue
import androidx.compose.ui.unit.IntSize
import androidx.lifecycle.ViewModel
import androidx.lifecycle.viewModelScope
import kotlinx.coroutines.delay
import kotlinx.coroutines.flow.MutableSharedFlow
import kotlinx.coroutines.flow.MutableStateFlow
import kotlinx.coroutines.flow.SharedFlow
import kotlinx.coroutines.flow.asSharedFlow
import kotlinx.coroutines.flow.asStateFlow
import kotlinx.coroutines.launch
import kotlin.random.Random


private const val RESPAWN = 500L
private const val TICK = 350L

class JuegoViewModel() : ViewModel()
{
    val size = 300
    var nombre : String = ""
    var isCorriendo = false
    private var _puntos = MutableStateFlow(0)
    private val _elapsedTime = MutableStateFlow(30)
    private val _estaJugando = MutableSharedFlow<Unit>()
    val tiempoPasado = _elapsedTime.asStateFlow()
    val puntos = _puntos.asStateFlow()
    val estaJugando : SharedFlow<Unit> = _estaJugando.asSharedFlow()
    var botonVisible by mutableStateOf(true)
    var canvasSize by mutableStateOf(IntSize(0,0))
    var posX by mutableIntStateOf(150)
    var posY by mutableIntStateOf(150)


    fun startGame(user: String) {
        _puntos.value = 0
        _elapsedTime.value = 30
        botonVisible = false
        isCorriendo = true
        nombre = user
        empezarTimer(nombre)
    }

    fun updatePosition() {
        // Log.d("POSICION ACTUAL", "x = $posX, y = $posY")
        posX = Random.nextInt(canvasSize.width - size)
        posY = Random.nextInt(canvasSize.height - size)
        // Log.d("NUEVA POSICION", "x = $posX, y = $posY")
    }


    fun sumarPunto()
    {
        _puntos.value++
        updatePosition()
        Log.d("Puntos", "Sume un punto, tengo $puntos puntos")
    }

    fun terminarJuego(user : String)
    {
        isCorriendo = false
        botonVisible = true
        Log.d("Tag3", "termino el juego, hiciste $puntos $user")
    }

    private fun empezarTimer(user : String)
    {
        viewModelScope.launch()
        {
            while(_elapsedTime.value > 0 && isCorriendo)
            {
                delay(1000L)
                _elapsedTime.value -= 1
            }
            Log.d("tag4", "Termino el juego, agrega el coso a la db")
            _estaJugando.emit(Unit)
            terminarJuego(user)
        }

        viewModelScope.launch {
            var contadorRespawn = RESPAWN
            while(isCorriendo){
                delay(TICK)
                if (!isCorriendo) break

                contadorRespawn -= TICK
                if (contadorRespawn <= 0)
                {
                    updatePosition()
                }
            }
        }

    }
}


