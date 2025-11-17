package com.example.juego_topos.screens

import androidx.lifecycle.viewmodel.compose.viewModel
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
import androidx.compose.material.icons.automirrored.filled.ArrowBack
import androidx.compose.material.icons.filled.Star
import androidx.compose.material3.Button
import androidx.compose.material3.Icon
import androidx.compose.material3.IconButton
import androidx.compose.material3.MaterialTheme
import androidx.compose.material3.Text
import androidx.compose.runtime.Composable
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
import androidx.compose.ui.tooling.preview.Devices
import androidx.compose.ui.tooling.preview.Preview
import androidx.compose.ui.unit.IntOffset
import androidx.compose.ui.unit.IntSize
import androidx.compose.ui.unit.dp
import com.example.juego_topos.R
import com.example.juego_topos.ui.theme.GameTheme

@Composable
fun GameScreen(
    viewModel : JuegoViewModel = viewModel()
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
        val tiempo by viewModel.tiempoPasado.collectAsState()
        TopBar(tiempo, viewModel)
        GameSection(viewModel)
        if(viewModel.botonVisible){
            Button(onClick = { viewModel.startJuego() })
            {
                Text("Jugar")
            }
        }
    }

}

@Composable
fun TopBar(tiempo : Int, viewModel: JuegoViewModel, modifier: Modifier = Modifier)
{
    Row(horizontalArrangement = Arrangement.SpaceBetween,
        verticalAlignment = Alignment.CenterVertically,
        modifier = modifier.fillMaxWidth())
    {
        IconButton(
            onClick = {}
        )
        {
            Icon(
                imageVector = Icons.AutoMirrored.Filled.ArrowBack,
                contentDescription = null
            )
        }
        Text("Tiempo: $tiempo")
        Row(horizontalArrangement = Arrangement.SpaceBetween,
            modifier = modifier.padding(end = 16.dp))
        {
            Icon(
                imageVector = Icons.Default.Star,
                contentDescription = null
            )
            Text("${viewModel.puntos}")
        }
    }
}




@Composable
fun GameSection(viewModel : JuegoViewModel)
{
    val topo = ImageBitmap.imageResource(id = R.drawable.resetti)
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

@Preview(
    name = "Login - Pixel 6 (Modo Claro)",
    showSystemUi = true,
    showBackground = true,
    backgroundColor = 0xFFF5F5F5,
    device = Devices.PIXEL_7_PRO)
@Composable
fun PreviewGame()
{
    GameTheme{
        GameScreen()
    }
}