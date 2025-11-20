package com.example.juego_topos.model

import android.util.Log
import androidx.lifecycle.ViewModel
import androidx.lifecycle.ViewModelProvider
import androidx.lifecycle.viewModelScope
import com.example.juego_topos.data.entities.PuntajeEntity
import com.example.juego_topos.repository.PuntajesRepository
import kotlinx.coroutines.flow.MutableStateFlow
import kotlinx.coroutines.flow.StateFlow
import kotlinx.coroutines.launch
import java.util.Collections.emptyList


sealed interface PuntajesUiState
{
    data class Success(val puntajes: List<PuntajeEntity>): PuntajesUiState
    object Error
    object Idle
}

class PuntajesViewModel(val repository: PuntajesRepository) : ViewModel()
{
    private val puntajesAltos = MutableStateFlow(PuntajesUiState.Success(emptyList()))
    val puntajes: StateFlow<PuntajesUiState> = puntajesAltos

    private val playerPuntajes = MutableStateFlow(PuntajesUiState.Success(emptyList()))
    val puntajesPlayer: StateFlow<PuntajesUiState> = playerPuntajes

    init {
        getAllPuntajes()
    }
    fun getAllPuntajes()
    {
        viewModelScope.launch {
            repository.puntajesAltos.collect { puntajes ->
                puntajesAltos.value = PuntajesUiState.Success(puntajes)
            }
        }
    }

    fun getPuntajeByName(nombre: String)
    {
        viewModelScope.launch()
        {
            repository.getPuntajesFromPlayer(nombre).collect { puntajes ->
                playerPuntajes.value = PuntajesUiState.Success(puntajes)
            }
        }
    }

    fun insertar(puntaje : PuntajeEntity)
    {
        viewModelScope.launch{
            val existe = repository.checkIfExiste(puntaje.nombrePlayer, puntaje.puntaje )
            if (existe == 0)
            {
                repository.insert(puntaje)
            }
            else
            {
                Log.d("Tag9", "Este puntaje ya lo hiciste")
            }
        }
    }
}


class PuntajesViewModelFactory(private val repository: PuntajesRepository) : ViewModelProvider.Factory
{
    override fun <T : ViewModel> create(modelClass: Class<T>): T {
        if (modelClass.isAssignableFrom(PuntajesViewModel::class.java))
        {
            @Suppress("UNCHECKED_CAST")
            return PuntajesViewModel(repository) as T
        }
        throw IllegalArgumentException("Unknown ViewModel class")
    }
}