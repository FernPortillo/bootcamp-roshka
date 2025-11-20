package com.example.juego_topos.screens

import androidx.compose.foundation.layout.Arrangement
import androidx.compose.foundation.layout.Column
import androidx.compose.foundation.layout.Row
import androidx.compose.foundation.layout.fillMaxSize
import androidx.compose.foundation.layout.fillMaxWidth
import androidx.compose.foundation.layout.padding
import androidx.compose.foundation.lazy.LazyColumn
import androidx.compose.material3.Text
import androidx.compose.runtime.Composable
import androidx.compose.runtime.collectAsState
import androidx.compose.runtime.getValue
import com.example.juego_topos.model.PuntajesViewModel
import androidx.compose.foundation.lazy.items
import androidx.compose.material.icons.Icons
import androidx.compose.material.icons.filled.Person
import androidx.compose.material3.Card
import androidx.compose.material3.Icon
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.unit.dp
import com.example.juego_topos.data.entities.PuntajeEntity
import com.example.juego_topos.model.PuntajesUiState


@Composable
fun LayoutUser(
    puntajesViewModel: PuntajesViewModel,
    nombre: String?)
{
    puntajesViewModel.getPuntajeByName(nombre!!)
    val allUserPuntajes by puntajesViewModel.puntajesPlayer.collectAsState()
    when(val state = allUserPuntajes)
    {
        is PuntajesUiState.Success -> ListaPuntajes(state.puntajes, nombre)
    }

}

@Composable
fun ListaPuntajes(puntajes : List<PuntajeEntity>, nombre: String?)
{
    Column(horizontalAlignment = Alignment.CenterHorizontally)
    {
        Text(
            "Bienvenido $nombre, estos son tus puntos",
            modifier = Modifier.fillMaxWidth()
        )
        LazyColumn(
            modifier = Modifier.fillMaxSize(),
            horizontalAlignment = Alignment.CenterHorizontally,
            verticalArrangement = Arrangement.Center
        )
        {
            items(puntajes)
            { puntaje ->
                cartaPuntajes(puntaje)
            }
        }
    }
}


@Composable
fun cartaPuntajes(puntaje: PuntajeEntity)
{
    Card(modifier = Modifier
        .fillMaxWidth()
        .padding(horizontal = 16.dp, vertical = 8.dp)
        .fillMaxWidth(0.9f))
    {
        Column {
            Row(
                verticalAlignment = Alignment.CenterVertically,
                modifier = Modifier
            )
            {
                Icon(
                    imageVector = Icons.Default.Person,
                    contentDescription = null
                )
                Text(puntaje.nombrePlayer)
            }
            Text("Hiciste ${puntaje.puntaje} ${if(puntaje.puntaje > 1) "puntos" else "punto"}")
        }
    }
}