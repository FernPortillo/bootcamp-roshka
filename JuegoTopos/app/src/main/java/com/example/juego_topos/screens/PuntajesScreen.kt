package com.example.juego_topos.screens

import androidx.compose.foundation.layout.Arrangement
import androidx.compose.foundation.layout.Column
import androidx.compose.foundation.layout.fillMaxSize
import androidx.compose.foundation.lazy.LazyColumn
import androidx.compose.foundation.lazy.items
import androidx.compose.material3.Text
import androidx.compose.runtime.Composable
import androidx.compose.runtime.collectAsState
import androidx.compose.runtime.getValue
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import com.example.juego_topos.data.entities.PuntajeEntity
import com.example.juego_topos.model.AuthViewmodel
import com.example.juego_topos.model.PuntajesUiState
import com.example.juego_topos.model.PuntajesViewModel

@Composable
fun LayoutPuntajes(
    puntajesViewModel: PuntajesViewModel,
    authViewmodel: AuthViewmodel,
    nombre : String
)
{
    val puntajes by puntajesViewModel.puntajes.collectAsState()
    when (val state = puntajes)
    {
        is PuntajesUiState.Success ->
            {
                Leaderboard(state, authViewmodel, nombre)
            }
    }
}


@Composable
fun Leaderboard(state: PuntajesUiState.Success,
                authViewmodel: AuthViewmodel,
                nombre: String)
{
    Column(verticalArrangement = Arrangement.Center,
        horizontalAlignment = Alignment.CenterHorizontally,
        modifier = Modifier.fillMaxSize())
    {
        Text("Bienvenido $nombre")
        LeaderboardLazyColumn(state.puntajes)
    }
}

@Composable
fun LeaderboardLazyColumn(puntajes : List<PuntajeEntity>)
{
    LazyColumn()
    {
        items(puntajes)
        {
            puntos ->
            Text("${puntos.nombrePlayer} hizo ${puntos.puntaje} puntos")
        }
    }
}
