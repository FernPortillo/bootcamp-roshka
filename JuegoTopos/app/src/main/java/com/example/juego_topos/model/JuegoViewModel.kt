package com.example.juego_topos.model

import android.util.Log
import androidx.compose.runtime.getValue
import androidx.compose.runtime.mutableStateOf
import androidx.compose.runtime.setValue
import androidx.compose.ui.unit.IntSize
import androidx.lifecycle.ViewModel
import androidx.lifecycle.viewModelScope
import kotlinx.coroutines.delay
import kotlinx.coroutines.flow.MutableStateFlow
import kotlinx.coroutines.flow.asStateFlow
import kotlinx.coroutines.launch
import kotlin.random.Random


private const val RESPAWN = 500L
private const val TICK = 350L

class JuegoViewModel : ViewModel(){
    val size = 300
    var isCorriendo = false
    private set
    private val _elapsedTime = MutableStateFlow(30)
    val tiempoPasado = _elapsedTime.asStateFlow()
    var botonVisible by mutableStateOf(true)
    var canvasSize by mutableStateOf(IntSize(0,0))
    var puntos by mutableStateOf(0)
    var posX by mutableStateOf(150)
    var posY by mutableStateOf(150)

    private fun empezarTimer()
    {
        viewModelScope.launch()
        {
            while(_elapsedTime.value > 0 && isCorriendo)
            {
                delay(1000L)
                _elapsedTime.value -= 1
            }
            isCorriendo = false
            botonVisible = true
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

    fun startJuego() {
        puntos = 0
        _elapsedTime.value = 30
        botonVisible = false
        isCorriendo = true
        empezarTimer()
    }

    fun sumarPunto()
    {
        puntos++
        updatePosition()
        Log.d("Puntos", "Sume un punto, tengo $puntos puntos")
    }

    fun updatePosition() {
        // Log.d("POSICION ACTUAL", "x = $posX, y = $posY")
        posX = Random.nextInt(canvasSize.width - size)
        posY = Random.nextInt(canvasSize.height - size)
        // Log.d("NUEVA POSICION", "x = $posX, y = $posY")
    }
}