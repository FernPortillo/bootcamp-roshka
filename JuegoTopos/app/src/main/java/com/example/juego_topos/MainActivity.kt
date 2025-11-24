package com.example.juego_topos

import android.os.Bundle
import androidx.activity.ComponentActivity
import androidx.activity.compose.setContent
import androidx.activity.enableEdgeToEdge
import androidx.activity.viewModels
import com.example.juego_topos.navigator.NavigationApp
import com.example.juego_topos.model.AuthViewmodel
import com.example.juego_topos.model.AuthViewmodelFactory
import com.example.juego_topos.model.ListaPokemonViewModel
import com.example.juego_topos.model.ListaPokemonViewmodelFactory
import com.example.juego_topos.model.PokemonDetailsViewModel
import com.example.juego_topos.model.PokemonDetailsViewModelFactory
import com.example.juego_topos.model.PuntajesViewModel
import com.example.juego_topos.model.PuntajesViewModelFactory
import com.example.juego_topos.repository.MyApplication
import com.example.juego_topos.repository.PokemonDetailsRepository
import com.example.juego_topos.ui.theme.GameTheme
import kotlin.getValue

class MainActivity : ComponentActivity() {
    private val puntajesViewModel: PuntajesViewModel by viewModels()
    {
        PuntajesViewModelFactory(
            (application as MyApplication).puntajesRepository
        )
    }

    private val listaPokemonViewModel: ListaPokemonViewModel by viewModels()
    {
        ListaPokemonViewmodelFactory(
            (application as MyApplication).listaPokemonRepository
        )
    }
    private val pokemonDetailViewModel: PokemonDetailsViewModel by viewModels()
    {
        PokemonDetailsViewModelFactory(
            (application as MyApplication).pokemonDetailRepository
        )
    }

    private val authViewmodel: AuthViewmodel by viewModels()
    {
        AuthViewmodelFactory(
            (application as MyApplication).usersRepository
        )
    }


    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        enableEdgeToEdge()
        setContent {
            GameTheme {
                NavigationApp(puntajesViewModel, authViewmodel, listaPokemonViewModel, pokemonDetailsViewModel = pokemonDetailViewModel)
            }
        }
    }
}
