package com.example.juego_topos.model

import androidx.lifecycle.ViewModel
import androidx.lifecycle.ViewModelProvider
import androidx.lifecycle.viewModelScope
import androidx.lifecycle.viewmodel.compose.viewModel
import com.example.juego_topos.data.PuntajeEntity
import com.example.juego_topos.repository.PuntajesRepository
import kotlinx.coroutines.flow.MutableStateFlow
import kotlinx.coroutines.flow.StateFlow
import kotlinx.coroutines.launch
import java.util.Collections.emptyList


sealed interface PuntajesUiState
{
    data class Success(val puntajes: List<PuntajeEntity>): PuntajesUiState
    object Error
}

class PuntajesViewModel(val repository: PuntajesRepository) : ViewModel()
{
    private val puntajesAltos = MutableStateFlow(PuntajesUiState.Success(emptyList()))
    val puntajes: StateFlow<PuntajesUiState> = puntajesAltos

    init {
        viewModelScope.launch {
            repository.puntajesAltos.collect { puntajes ->
                puntajesAltos.value = PuntajesUiState.Success(puntajes)
            }
        }
    }

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