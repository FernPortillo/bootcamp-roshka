package com.example.pokedex.model

import android.net.http.HttpException
import android.os.Build
import android.util.Log
import androidx.annotation.RequiresExtension
import androidx.compose.runtime.getValue
import androidx.compose.runtime.mutableStateOf
import androidx.compose.runtime.setValue
import androidx.lifecycle.ViewModel
import androidx.lifecycle.ViewModelProvider
import androidx.lifecycle.ViewModelProvider.AndroidViewModelFactory.Companion.APPLICATION_KEY
import androidx.lifecycle.viewModelScope
import androidx.lifecycle.viewmodel.compose.viewModel
import androidx.lifecycle.viewmodel.initializer
import androidx.lifecycle.viewmodel.viewModelFactory
import com.example.pokedex.PokedexApplication
import com.example.pokedex.data.PokemonRepository
import kotlinx.coroutines.flow.MutableStateFlow
import kotlinx.coroutines.launch
import java.io.IOException

sealed interface PokemonUiState
{
    data class SuccessList(val pokemon : PokemonAPI): PokemonUiState
    data class SuccessDetail(val pokemon : PokemonData) : PokemonUiState
    object Error: PokemonUiState
    object Loading : PokemonUiState
}

@RequiresExtension(extension = Build.VERSION_CODES.S, version = 7)
class PokemonViewmodel(private val pokemonRepository: PokemonRepository) : ViewModel()
{
    var pokemonUiState: PokemonUiState by mutableStateOf(PokemonUiState.Loading)
        private set


    init
    {
        getPokemonById("9")
    }

    @RequiresExtension(extension = Build.VERSION_CODES.S, version = 7)
    fun getPokemon() {
        viewModelScope.launch {
            pokemonUiState = PokemonUiState.Loading
            pokemonUiState = try {
                val resultados = pokemonRepository.getPokemon()
                val tag: String = "MY_TAG"
                Log.d(tag, "Exito, se trajeron ${resultados.results.size} resultados")
                PokemonUiState.SuccessList(resultados)
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

    fun getPokemonByName(nombrePokemon : String)
    {
        viewModelScope.launch{
            pokemonUiState = PokemonUiState.Loading
            pokemonUiState = try {
                val resultado = pokemonRepository.getPokemonByName(nombrePokemon)
                val tag: String = "TAG_NOMBRE_POKE"
                Log.d(tag, "Exito, consegui a ${resultado.species.name}, \" +\n" +
                        "                        \"es el pokemon numero ${resultado.id}, tiene la habilidad ${resultado.abilities[0].ability!!.name} \" +\n" +
                        "                        \"y es de tipo ${resultado.types[0].type.name} y ${resultado.types[1].type.name}\"")
                PokemonUiState.SuccessDetail(resultado)
            }
            catch (e: IOException)
            {
                PokemonUiState.Error
            }
            catch (e: HttpException)
            {
                PokemonUiState.Loading
            }
        }
    }

    fun getPokemonById(idPokemon : String)
    {
        viewModelScope.launch{
            pokemonUiState = PokemonUiState.Loading
            pokemonUiState = try {
                val resultado = pokemonRepository.getPokemonByName(idPokemon)
                PokemonUiState.SuccessDetail(resultado)
            }
            catch (e: IOException)
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

