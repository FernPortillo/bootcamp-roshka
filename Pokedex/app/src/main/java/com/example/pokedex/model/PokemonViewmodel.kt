package com.example.pokedex.model

import android.net.http.HttpException
import android.os.Build
import androidx.annotation.RequiresExtension
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
    data class Success(val pokemon : List<Result>): PokemonUiState
    object Error: PokemonUiState
    object Loading : PokemonUiState
}

@RequiresExtension(extension = Build.VERSION_CODES.S, version = 7)
class PokemonViewmodel(private val pokemonRepository: PokemonRepository) : ViewModel()
{
    var pokemonUiState: PokemonUiState by mutableStateOf(PokemonUiState.Loading)
        private set

    private val _pokemonDetailsCache = mutableMapOf<String, PokemonData>()
    val pokemonDetailsCache: Map<String, PokemonData> = _pokemonDetailsCache


    init
    {
        getPokemon()
    }

    @RequiresExtension(extension = Build.VERSION_CODES.S, version = 7)
    fun getPokemon() {
        viewModelScope.launch {
            pokemonUiState = PokemonUiState.Loading
            pokemonUiState = try {
                val resultados = pokemonRepository.getPokemon()
                PokemonUiState.Success(resultados.results)
            } catch (_: IOException)
            {
                PokemonUiState.Error
            }
            catch (_: HttpException)
            {
                PokemonUiState.Loading
            }
        }
    }

    fun loadPokemonDetails(pokemonUrl : String)
    {
        if (pokemonDetailsCache.containsKey(pokemonUrl)) return
        viewModelScope.launch()
        {
            try {
                val detail = pokemonRepository.getPokemonByUrl(pokemonUrl)
                _pokemonDetailsCache[pokemonUrl] = detail
            }
            catch (_: Exception){}
        }


    }

//    fun getPokemonById(idPokemon : String)
//    {
//        viewModelScope.launch{
//            pokemonUiState = PokemonUiState.Loading
//            pokemonUiState = try {
//                val resultado = pokemonRepository.getPokemonByName(idPokemon)
//                PokemonUiState.SuccessDetail(resultado)
//            }
//            catch (_: IOException)
//            {
//                PokemonUiState.Error
//            }
//            catch (_: HttpException)
//            {
//                PokemonUiState.Loading
//            }
//        }
//    }

//    fun loadPokemonDetails(pokemonList: PokemonAPI) {
//        viewModelScope.launch {
//            pokemonUiState = PokemonUiState.Loading
//            try {
//                val detalles = pokemonList.results.map { pokemonItem ->
//                    pokemonRepository.getPokemonByUrl(pokemonItem.url)
//                }
//                pokemonUiState = PokemonUiState.SuccessDetail(detalles)
//            } catch (_: IOException) {
//                pokemonUiState = PokemonUiState.Error
//            }
//        }
//    }



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


