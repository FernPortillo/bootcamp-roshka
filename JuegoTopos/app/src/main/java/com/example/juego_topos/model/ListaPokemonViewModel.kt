package com.example.juego_topos.model

import android.util.Log
import androidx.lifecycle.ViewModel
import androidx.lifecycle.ViewModelProvider
import androidx.lifecycle.viewModelScope
import com.example.juego_topos.network.serializables.ListaPokemonDataModel
import com.example.juego_topos.repository.PokemonRepository
import com.example.juego_topos.repository.UsersRepository
import kotlinx.coroutines.flow.MutableStateFlow
import kotlinx.coroutines.flow.StateFlow
import kotlinx.coroutines.flow.asStateFlow
import kotlinx.coroutines.launch

class ListaPokemonViewModel(val repository: PokemonRepository) : ViewModel()
{
    private var _listaPokemon = MutableStateFlow<ListaPokemonDataModel?>(null)
    private val _error = MutableStateFlow<String?>(null)
    private val _estaCargando = MutableStateFlow<Boolean?>(null)

    val listaPokemon : StateFlow<ListaPokemonDataModel?> = _listaPokemon.asStateFlow()
    val error : StateFlow<String?> = _error.asStateFlow()
    val estaCargando : StateFlow<Boolean?> = _estaCargando.asStateFlow()

    fun getListaPokemon()
    {
        viewModelScope.launch {
            _estaCargando.value = true
            val response = repository.getPokemon(0, 150)
            if(response.isSuccessful)
            {
                val body = response.body()
                if (body != null)
                {
                    Log.d("Exito", "${body.results.size}")
                    _estaCargando.value = false
                    _listaPokemon.value = body
                }
            }
            else
            {
                val error = response.body()
                if(error != null)
                {
                    Log.d("Error de lista", error.toString())
                }
            }
        }
    }

}

// TODO arreglar :p
class ListaPokemonViewmodelFactory(private val repository: UsersRepository): ViewModelProvider.Factory
{
    override fun <T : ViewModel> create(modelClass: Class<T>): T {
        if (modelClass.isAssignableFrom(AuthViewmodel::class.java))
        {
            @Suppress("UNCHECKED_CAST")
            return AuthViewmodel(repository) as T
        }
        throw IllegalArgumentException("Clase de Viewmodel Desconocido")
    }
}