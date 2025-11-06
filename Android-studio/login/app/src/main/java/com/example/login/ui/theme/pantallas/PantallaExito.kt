package com.example.login.ui.theme.pantallas

import androidx.compose.foundation.Image
import androidx.compose.foundation.layout.Box
import androidx.compose.foundation.layout.Column
import androidx.compose.foundation.layout.fillMaxSize
import androidx.compose.foundation.layout.padding
import androidx.compose.material3.MaterialTheme
import androidx.compose.material3.Text
import androidx.compose.runtime.Composable
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.layout.ContentScale
import androidx.compose.ui.res.painterResource
import androidx.compose.ui.res.stringResource
import androidx.compose.ui.tooling.preview.Devices
import androidx.compose.ui.tooling.preview.Preview
import androidx.compose.ui.unit.dp
import com.example.login.R

@Composable
fun pantallaExito(modifier: Modifier)
{
    Box(Modifier.fillMaxSize(),
        contentAlignment = Alignment.Center){
        Column(horizontalAlignment = Alignment.CenterHorizontally) {
            Image(
                painter = painterResource(R.drawable.alpelowachin),
                contentDescription = null,
                modifier
                    .padding(48.dp),
                contentScale = ContentScale.Crop,
            )
            Text(
                text = stringResource(R.string.bienvenido),
                modifier.padding(32.dp),
                style = MaterialTheme.typography.headlineLarge
            )
        }
    }
}

@Composable
@Preview(
    name = "Login - Pixel 6 (Modo Claro)",
    showSystemUi = true,
    showBackground = true,
    backgroundColor = 0xFFF5F5F5,
    device = Devices.PIXEL_7_PRO)
fun previewAlPelo()
{
    pantallaExito(modifier = Modifier)
}