package com.example.pokedex.model

import android.net.http.HttpException
import android.util.Log
import androidx.compose.runtime.getValue
import androidx.compose.runtime.mutableStateOf
import androidx.compose.runtime.setValue
import androidx.lifecycle.ViewModel
import androidx.lifecycle.ViewModelProvider
import androidx.lifecycle.ViewModelProvider.AndroidViewModelFactory.Companion.APPLICATION_KEY
import androidx.lifecycle.viewModelScope
import androidx.lifecycle.viewmodel.initializer
import androidx.lifecycle.viewmodel.viewModelFactory
import com.example.pokedex.PokedexApplication
import com.example.pokedex.data.PokemonRepository
import kotlinx.coroutines.launch
import java.io.IOException

sealed interface PokemonUiState
{
    data class Success(val pokemon : String): PokemonUiState
    object Error: PokemonUiState
    object Loading : PokemonUiState
}

class PokemonViewmodel(private val pokemonRepository: PokemonRepository) : ViewModel()
{

    var pokemonUiState: PokemonUiState by mutableStateOf(PokemonUiState.Loading)
        private set


    init
    {
        getPokemon()
    }

    fun getPokemon() {
        viewModelScope.launch {
            pokemonUiState = PokemonUiState.Loading
            pokemonUiState = try {
                val resultados = pokemonRepository.getPokemon()
                val tag: String = "MY_TAG"
                Log.d(tag, "Exito, se trajeron ${resultados.results.size} resultados")
                PokemonUiState.Success("Exito, se trajeron ${resultados.results.size} resultados")
            } catch (e: IOException)
            {
                PokemonUiState.Error
            }
            catch (e: HttpException)
            {
                PokemonUiState.Loading
            }
        }
    }


    companion object {
        val Factory: ViewModelProvider.Factory = viewModelFactory {
            initializer {
                val application = (this[APPLICATION_KEY] as PokedexApplication)
                val pokemonRepository = application.container.pokemonRepository
                PokemonViewmodel(pokemonRepository)
            }
        }
    }
}

