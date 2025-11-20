package com.example.juego_topos.composables

import androidx.compose.ui.graphics.Color
import androidx.compose.material.icons.Icons
import androidx.compose.material.icons.filled.AccountBox
import androidx.compose.material.icons.filled.AccountCircle
import androidx.compose.material.icons.filled.Favorite
import androidx.compose.material.icons.filled.Menu
import androidx.compose.material.icons.filled.Star
import androidx.compose.material3.Icon
import androidx.compose.material3.NavigationBar
import androidx.compose.material3.NavigationBarItem
import androidx.compose.material3.Text
import androidx.compose.runtime.Composable
import androidx.compose.runtime.mutableIntStateOf
import androidx.compose.runtime.saveable.rememberSaveable
import androidx.navigation.NavController
import com.example.juego_topos.navigator.NavigationItem
import com.example.juego_topos.navigator.Screen

@Composable
fun BottomNavBar(mainScreenNavController : NavController)
{
    val selectedNavIndex = rememberSaveable() { mutableIntStateOf(0) }

    val navItems = listOf(
        NavigationItem(
            "Puntajes",
            Icons.Default.Menu,
            Screen.Puntajes.ruta
        ),
        NavigationItem(
            "Juego",
            Icons.Filled.Star,
            Screen.Juego.ruta
        ),
        NavigationItem(
            "Pokedex",
            Icons.Filled.Favorite,
            Screen.Pokedex.ruta
        ),
        NavigationItem(
            "Mi Cuenta",
            Icons.Default.AccountCircle,
            Screen.User.ruta
        )
    )

    NavigationBar(
        containerColor = Color.White
    )
    {
        navItems.forEachIndexed { index, item ->
            NavigationBarItem(
                selected = selectedNavIndex.intValue == index,
                onClick = {
                    selectedNavIndex.intValue = index
                    mainScreenNavController.navigate(item.route)},
                icon = { Icon(imageVector = item.icono, contentDescription = null) },
                label = {
                    Text(
                        item.nombre,
                        color = if (selectedNavIndex.intValue == index) Color.Black else Color.Gray
                    )
                }
            )
        }
    }
}