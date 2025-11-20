package com.example.juego_topos.screens

import android.util.Log
import androidx.compose.ui.geometry.Rect
import androidx.compose.ui.geometry.Size
import androidx.compose.foundation.Canvas
import androidx.compose.foundation.background
import androidx.compose.foundation.gestures.detectTapGestures
import androidx.compose.foundation.layout.Arrangement
import androidx.compose.foundation.layout.Column
import androidx.compose.foundation.layout.Row
import androidx.compose.foundation.layout.fillMaxHeight
import androidx.compose.foundation.layout.fillMaxSize
import androidx.compose.foundation.layout.fillMaxWidth
import androidx.compose.foundation.layout.padding
import androidx.compose.foundation.layout.statusBarsPadding
import androidx.compose.material.icons.Icons
import androidx.compose.material.icons.filled.Star
import androidx.compose.material3.Button
import androidx.compose.material3.Icon
import androidx.compose.material3.MaterialTheme
import androidx.compose.material3.Text
import androidx.compose.runtime.Composable
import androidx.compose.runtime.LaunchedEffect
import androidx.compose.runtime.collectAsState
import androidx.compose.runtime.getValue
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.geometry.Offset
import com.example.juego_topos.model.JuegoViewModel
import androidx.compose.ui.graphics.ImageBitmap
import androidx.compose.ui.input.pointer.pointerInput
import androidx.compose.ui.layout.onSizeChanged
import androidx.compose.ui.res.imageResource
import androidx.compose.ui.unit.IntOffset
import androidx.compose.ui.unit.IntSize
import androidx.compose.ui.unit.dp
import com.example.juego_topos.R
import com.example.juego_topos.data.entities.PuntajeEntity
import com.example.juego_topos.model.AuthViewmodel
import com.example.juego_topos.model.PuntajesViewModel
import androidx.lifecycle.viewmodel.compose.viewModel

@Composable
fun GameScreen(
    authViewmodel: AuthViewmodel,
    puntajesViewModel: PuntajesViewModel
    )
{
    Column(
        horizontalAlignment = Alignment.CenterHorizontally,
        verticalArrangement = Arrangement.SpaceEvenly,
        modifier = Modifier
            .fillMaxSize()
            .statusBarsPadding()

    )
    {
        val juegoViewModel : JuegoViewModel = viewModel()
        val tiempo by juegoViewModel.tiempoPasado.collectAsState()
        val nombre = authViewmodel.user
        val puntos by juegoViewModel.puntos.collectAsState()


        TopBar(tiempo, puntos)
        GameSection(juegoViewModel)


        if(juegoViewModel.botonVisible){
            Button(onClick = { juegoViewModel.startGame(nombre) })
            {
                Text("Jugar")
            }
        }

        LaunchedEffect(Unit)
        {
            Log.d("Tag 6", "Recibido, ingresando")
            juegoViewModel.estaJugando.collect()
            {
                insertarPuntos(puntajesViewModel, nombre, puntos)
                Log.d("Tag 7", "Ingresada correctamente")

            }
        }
    }
}

@Composable
fun TopBar(tiempo : Int,
           puntos: Int,
           modifier: Modifier = Modifier)
{
    Row(horizontalArrangement = Arrangement.SpaceBetween,
        verticalAlignment = Alignment.CenterVertically,
        modifier = modifier.fillMaxWidth())
    {

        Text("Tiempo: $tiempo")
        Row(horizontalArrangement = Arrangement.SpaceBetween,
            modifier = modifier.padding(end = 16.dp))
        {
            Icon(
                imageVector = Icons.Default.Star,
                contentDescription = null
            )
            Text("$puntos")
        }
    }
}

@Composable
fun GameSection(viewModel : JuegoViewModel)
{
    val topo = ImageBitmap.imageResource(id = R.drawable.diglett)
    Canvas(Modifier
        .fillMaxWidth(0.95f)
        .fillMaxHeight(0.85f)
        .background(MaterialTheme.colorScheme.primary)
        .onSizeChanged { size -> viewModel.canvasSize = size }
        .pointerInput(Unit)
        {
            detectTapGestures { tap: Offset ->
                val colision = Rect(
                    offset = Offset(
                        viewModel.posX.toFloat(),
                        viewModel.posY.toFloat()
                    ),
                    size = Size(
                        viewModel.size.toFloat(),
                        viewModel.size.toFloat()
                    )
                )
                if (colision.contains(tap) && viewModel.isCorriendo) {
                    viewModel.sumarPunto()
                }
            }
        })
    {

        drawImage(
            topo,
            dstOffset = IntOffset(
                viewModel.posX,
                viewModel.posY),
            dstSize = IntSize(300,300),
        )
    }
}

fun insertarPuntos(puntajesViewModel: PuntajesViewModel, nombre : String, puntos : Int)
{
    puntajesViewModel.insertar(
        PuntajeEntity(
            nombrePlayer = nombre,
            puntaje = puntos))
}
