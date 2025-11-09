package com.example.login.ui.theme.pantallas

import androidx.compose.foundation.Image
import androidx.compose.foundation.background
import androidx.compose.foundation.layout.Arrangement
import androidx.compose.foundation.layout.Row
import androidx.compose.foundation.layout.aspectRatio
import androidx.compose.foundation.layout.fillMaxSize
import androidx.compose.foundation.layout.fillMaxWidth
import androidx.compose.foundation.layout.padding
import androidx.compose.foundation.layout.size
import androidx.compose.foundation.layout.wrapContentSize
import androidx.compose.foundation.lazy.LazyColumn
import androidx.compose.foundation.lazy.items
import androidx.compose.foundation.shape.CircleShape
import androidx.compose.material.icons.Icons
import androidx.compose.material.icons.filled.Delete
import androidx.compose.material3.Card
import androidx.compose.material3.Icon
import androidx.compose.material3.MaterialTheme
import androidx.compose.material3.SwipeToDismissBox
import androidx.compose.material3.SwipeToDismissBoxValue
import androidx.compose.material3.Text
import androidx.compose.material3.rememberSwipeToDismissBoxState
import androidx.compose.runtime.Composable
import androidx.compose.runtime.mutableStateListOf
import androidx.compose.runtime.remember
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.draw.clip
import androidx.compose.ui.graphics.Color
import androidx.compose.ui.layout.ContentScale
import androidx.compose.ui.res.painterResource
import androidx.compose.ui.res.stringResource
import androidx.compose.ui.tooling.preview.Devices
import androidx.compose.ui.tooling.preview.Preview
import androidx.compose.ui.unit.dp
import com.example.compose.LoginTheme
import com.example.login.R
import com.example.login.model.Contacto



@Composable
fun ContactosList( modifier: Modifier = Modifier)
{
    val contactos = remember {
        mutableStateListOf(
            Contacto(R.string.nombre1,22,R.drawable.bart),
            Contacto(R.string.nombre2, 19, R.drawable.ney),
            Contacto(R.string.nombre3, 59, R.drawable.kir),
            Contacto(R.string.nombre4, 34, R.drawable.pika2),
            Contacto(R.string.nombre5, 29, R.drawable.darwin)
        )
    }
    LazyColumn(
        horizontalAlignment = Alignment.CenterHorizontally,
        verticalArrangement = Arrangement.Center,
        modifier = modifier
            .fillMaxSize()
    ) {
        items(contactos) { contacto ->
            SwipeBox(contacto,
                onRemove = { contacto ->
                    contactos -= contacto
                },
                modifier = Modifier.animateItem())

        }
    }
}

@Composable
private fun ContactoCard(contacto: Contacto, modifier: Modifier)
{
    Card(
        modifier = modifier.padding(8.dp)
    ){
        Row(
            verticalAlignment = Alignment.CenterVertically,
            modifier = Modifier
                .padding(horizontal = 16.dp, vertical = 8.dp)
                .fillMaxWidth(0.9f)
        ) {
            Image(
                painter = painterResource(contacto.imagenContactoDrawableRes),
                contentDescription = stringResource(contacto.nombreContactoStringResId),
                contentScale = ContentScale.Crop,
                modifier = Modifier.size(68.dp)
                    .aspectRatio(1f)
                    .clip(CircleShape)

            )
            Text(
                text = stringResource(contacto.nombreContactoStringResId),
                style = MaterialTheme.typography.headlineSmall,
                modifier = Modifier.padding(16.dp)

            )
        }
    }
}


@Composable
fun SwipeBox(
    contacto: Contacto,
    onRemove : (Contacto) -> Unit,
    modifier: Modifier = Modifier
)
{
    val swipeToDismissBoxState = rememberSwipeToDismissBoxState(
        confirmValueChange = {
            if (it == SwipeToDismissBoxValue.EndToStart) onRemove(contacto)
            // Reset item when toggling done status
            it != SwipeToDismissBoxValue.StartToEnd
        }
    )

    SwipeToDismissBox(
        state = swipeToDismissBoxState,
        modifier = modifier.fillMaxSize(),
        backgroundContent = {
            when (swipeToDismissBoxState.dismissDirection) {
                SwipeToDismissBoxValue.StartToEnd -> {}
                SwipeToDismissBoxValue.EndToStart -> {
                    Icon(
                        imageVector = Icons.Default.Delete,
                        contentDescription = "Remove item",
                        modifier = Modifier
                            .fillMaxSize(0.9f)
                            .background(Color.Red)
                            .wrapContentSize(Alignment.CenterEnd)
                            .padding(horizontal = 16.dp, vertical = 8.dp),
                        tint = Color.White
                    )
                }
                SwipeToDismissBoxValue.Settled -> {}
            }
        }
    )
    {
        ContactoCard(contacto, modifier)
    }

}




@Composable
@Preview(
    name = "Login - Pixel 6 (Modo Claro)",
    showSystemUi = true,
    showBackground = true,
    backgroundColor = 0xFFF5F5F5,
    device = Devices.PIXEL_7_PRO)
fun PreviewContacto()
{
    LoginTheme{
        ContactosList()
    }
}