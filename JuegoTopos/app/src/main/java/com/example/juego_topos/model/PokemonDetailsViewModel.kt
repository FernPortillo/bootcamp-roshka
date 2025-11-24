package com.example.juego_topos.model

import android.util.Log
import androidx.lifecycle.ViewModel
import androidx.lifecycle.ViewModelProvider
import androidx.lifecycle.viewModelScope
import com.example.juego_topos.network.serializables.PokemonDetailDataModel
import com.example.juego_topos.repository.PokemonDetailsRepository
import kotlinx.coroutines.flow.MutableStateFlow
import kotlinx.coroutines.flow.StateFlow
import kotlinx.coroutines.flow.asStateFlow
import kotlinx.coroutines.launch


class PokemonDetailsViewModel(val repository: PokemonDetailsRepository): ViewModel() {
        private val _pokemonDetails = MutableStateFlow<PokemonDetailDataModel?>(null)
        private val _isLoading = MutableStateFlow<Boolean>(true)
        private val _gotError = MutableStateFlow<Boolean>(false)

        // States
        val pokemonDetails: StateFlow<PokemonDetailDataModel?> get() = _pokemonDetails.asStateFlow()
        val isLoading: StateFlow<Boolean> get() = _isLoading.asStateFlow()
        val gotError: StateFlow<Boolean> get() = _gotError.asStateFlow()

        fun fetchDetails(name: String) {
            viewModelScope.launch {
                _isLoading.value = true
                val result = repository.getPokemonDetails(name)
                val error = result.errorBody()
                val data = result.body()
                if (error != null || !result.isSuccessful) {
                    Log.d("error", "error de data")
                    _isLoading.value = false
                    _gotError.value = true
                    return@launch
                }
                if (data != null) {
                    Log.d("Got data", "Got data")
                    _isLoading.value = false
                    _pokemonDetails.value = data
                } else {
                    Log.d("nada", "nada")
                    _isLoading.value = false
                }
            }
        }
    }
class PokemonDetailsViewModelFactory (private val repository: PokemonDetailsRepository): ViewModelProvider.Factory
{
    override fun <T : ViewModel> create(modelClass: Class<T>): T {
        if (modelClass.isAssignableFrom(PokemonDetailsViewModel::class.java))
        {
            @Suppress("UNCHECKED_CAST")
            return PokemonDetailsViewModel(repository) as T
        }
        throw IllegalArgumentException("Clase de Viewmodel Desconocido")
    }
}