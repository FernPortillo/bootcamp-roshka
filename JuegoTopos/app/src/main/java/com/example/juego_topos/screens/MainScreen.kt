package com.example.juego_topos.screens

import androidx.compose.foundation.layout.fillMaxSize
import androidx.compose.foundation.layout.padding
import androidx.compose.material3.Scaffold
import androidx.compose.runtime.Composable
import androidx.compose.ui.Modifier
import androidx.navigation.compose.NavHost
import androidx.navigation.compose.composable
import androidx.navigation.compose.rememberNavController
import androidx.navigation.createGraph
import com.example.juego_topos.navigator.Screen
import com.example.juego_topos.composables.BottomNavBar
import com.example.juego_topos.model.AuthViewmodel
import com.example.juego_topos.model.ListaPokemonViewModel
import com.example.juego_topos.model.PuntajesViewModel

@Composable
fun MainScreen(authViewmodel: AuthViewmodel,
               puntajesViewModel: PuntajesViewModel,
               listaPokemonViewModel: ListaPokemonViewModel,
               nombre: String)
{
    val mainScreenNavController = rememberNavController()
    val user = nombre
    Scaffold(
        modifier = Modifier
            .fillMaxSize(),
        bottomBar = { BottomNavBar(mainScreenNavController) }
    )
    { innerPadding ->

        val graph =
            mainScreenNavController.createGraph(startDestination = Screen.Puntajes.ruta)
            {
                composable(Screen.Puntajes.ruta)
                { LayoutPuntajes(
                    puntajesViewModel,
                    authViewmodel,
                    user) }
                composable(Screen.Juego.ruta)
                { GameScreen(
                    authViewmodel,
                    puntajesViewModel) }
                composable(Screen.User.ruta)
                {
                    LayoutUser(
                        puntajesViewModel,
                        user
                    )
                }
                composable(Screen.Pokedex.ruta){
                    LayoutPokedex(listaPokemonViewModel)
                }
            }

        NavHost(
            navController = mainScreenNavController,
            graph = graph,
            modifier = Modifier.padding(innerPadding)
        )
    }
}
