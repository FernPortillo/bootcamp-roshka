package com.example.juego_topos

import android.os.Bundle
import androidx.activity.ComponentActivity
import androidx.activity.compose.setContent
import androidx.activity.enableEdgeToEdge
import androidx.activity.viewModels
import androidx.compose.runtime.Composable
import androidx.compose.ui.tooling.preview.Preview
import com.example.juego_topos.model.JuegoViewModel
import com.example.juego_topos.model.JuegoViewModelFactory
import com.example.juego_topos.model.PuntajesViewModel
import com.example.juego_topos.model.PuntajesViewModelFactory
import com.example.juego_topos.repository.MyApplication
import com.example.juego_topos.screens.GameScreen
import com.example.juego_topos.screens.LayoutMainScreen
import com.example.juego_topos.ui.theme.GameTheme
import kotlin.getValue

class MainActivity : ComponentActivity() {
    private val puntajesViewModel : PuntajesViewModel by viewModels()
    {
        PuntajesViewModelFactory(
            (application as MyApplication).puntajesRepository
        )
    }

    private val juegoViewModel : JuegoViewModel by viewModels()
    {
        JuegoViewModelFactory(
            (application as MyApplication).puntajesRepository
        )
    }


    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        enableEdgeToEdge()
        setContent {
            GameTheme {
                    LayoutMainScreen(puntajesViewModel, onNavigateToJuego = {}, onNavigateToPokedex = {})

            }
        }
    }
}


@Preview(showBackground = true)
@Composable
fun GreetingPreview() {
    GameTheme {
        // GameScreen()
    }
}