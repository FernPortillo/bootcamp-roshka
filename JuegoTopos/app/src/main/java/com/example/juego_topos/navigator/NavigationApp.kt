package com.example.juego_topos.navigator

import androidx.compose.runtime.Composable
import androidx.navigation.compose.NavHost
import androidx.navigation.compose.composable
import androidx.navigation.compose.rememberNavController
import com.example.juego_topos.model.AuthViewmodel
import com.example.juego_topos.model.PuntajesViewModel
import com.example.juego_topos.screens.LayoutLogin
import com.example.juego_topos.screens.LayoutRegistro
import com.example.juego_topos.screens.MainScreen


@Composable
fun NavigationApp(
    puntajesViewModel: PuntajesViewModel,
    authViewmodel: AuthViewmodel
)
{
    val mainNavController = rememberNavController()

    NavHost(navController = mainNavController, startDestination = Screen.Login.ruta)
    {
        composable(Screen.Login.ruta)
        { LayoutLogin(authViewmodel, mainNavController) }
        composable(Screen.Register.ruta)
        { LayoutRegistro(authViewmodel, mainNavController) }
        composable(Screen.Main.ruta)
        { MainScreen(authViewmodel, puntajesViewModel, authViewmodel.user) }
    }
}