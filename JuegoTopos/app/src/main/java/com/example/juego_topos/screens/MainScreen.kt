package com.example.juego_topos.screens

import androidx.compose.foundation.layout.Column
import androidx.compose.material3.Text
import androidx.compose.runtime.Composable
import androidx.compose.runtime.collectAsState
import androidx.compose.runtime.getValue
import androidx.lifecycle.viewmodel.compose.viewModel
import com.example.juego_topos.data.PuntajeEntity
import com.example.juego_topos.model.PuntajesUiState
import com.example.juego_topos.model.PuntajesViewModel

@Composable
fun LayoutMainScreen(
    viewModel: PuntajesViewModel,
    onNavigateToPokedex :() -> Unit,
    onNavigateToJuego :() -> Unit,
)
{
    val puntajes by viewModel.puntajes.collectAsState()
    when (val state = puntajes)
    {
        is PuntajesUiState.Success ->
            {
            Text("${state.puntajes.size} son los puntajes")
            }
        is PuntajesUiState.Error -> {}
        is PuntajesUiState.Idle -> {}
    }
}
