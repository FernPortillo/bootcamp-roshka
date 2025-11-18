package com.example.juego_topos.model

import android.util.Log
import androidx.compose.runtime.getValue
import androidx.compose.runtime.mutableStateOf
import androidx.compose.runtime.setValue
import androidx.compose.ui.unit.IntSize
import androidx.lifecycle.ViewModel
import androidx.lifecycle.ViewModelProvider
import androidx.lifecycle.viewModelScope
import androidx.lifecycle.viewmodel.compose.viewModel
import com.example.juego_topos.data.PuntajeEntity
import com.example.juego_topos.repository.PuntajesRepository
import kotlinx.coroutines.delay
import kotlinx.coroutines.flow.MutableStateFlow
import kotlinx.coroutines.flow.asStateFlow
import kotlinx.coroutines.launch
import kotlin.random.Random


private const val RESPAWN = 500L
private const val TICK = 350L

class JuegoViewModel(val repository : PuntajesRepository) : ViewModel()
{
    // TODO integrar que cuando se termine una sesion se guarde tu puntaje
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

    fun insertar(puntaje : PuntajeEntity)
    {
        viewModelScope.launch{
            repository.insert(puntaje)
        }
    }

    fun borrar(puntaje: PuntajeEntity)
    {
        viewModelScope.launch {
            repository.delete(puntaje)
        }
    }

    fun startGame() {
        puntos = 0
        _elapsedTime.value = 30
        botonVisible = false
        isCorriendo = true
        empezarTimer()
    }

    fun updatePosition() {
        // Log.d("POSICION ACTUAL", "x = $posX, y = $posY")
        posX = Random.nextInt(canvasSize.width - size)
        posY = Random.nextInt(canvasSize.height - size)
        // Log.d("NUEVA POSICION", "x = $posX, y = $posY")
    }


    fun sumarPunto()
    {
        puntos++
        updatePosition()
        Log.d("Puntos", "Sume un punto, tengo $puntos puntos")
    }

    fun terminarJuego()
    {
        if (isCorriendo)
        {
            return
        }

        viewModelScope.launch()
        {
        }

    }

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
}

data class PuntajeState(
    val puntos : Int = 0,
    val nombre : String = ""
)

class JuegoViewModelFactory(private val repository: PuntajesRepository) : ViewModelProvider.Factory
{
    override fun <T : ViewModel> create(modelClass: Class<T>): T {
        if (modelClass.isAssignableFrom(JuegoViewModel::class.java))
        {
            @Suppress("UNCHECKED_CAST")
            return JuegoViewModel(repository) as T
        }
        throw IllegalArgumentException("Unknown ViewModel class")
    }
}