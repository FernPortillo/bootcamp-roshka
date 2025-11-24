package com.example.juego_topos.navigator

import androidx.compose.ui.graphics.vector.ImageVector

sealed class Screen(val ruta : String) {
    object Login : Screen("login")
    object Register : Screen("registro")
    object Main : Screen("main")
    object Juego : Screen("juego")
    object Puntajes : Screen("puntajes")
    object User : Screen("user")
    object Pokedex : Screen("pokedex")
    object Pokemon : Screen("pokemon/{nombrePokemon}")
    {
        fun createRoute(nombre: String) = "pokemon/$nombre"
    }
}

data class NavigationItem(
    val nombre: String,
    val icono: ImageVector,
    val route: String
)
