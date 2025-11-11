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
import androidx.compose.foundation.layout.statusBarsPadding
import androidx.compose.foundation.layout.wrapContentSize
import androidx.compose.foundation.lazy.LazyColumn
import androidx.compose.foundation.lazy.items
import androidx.compose.foundation.shape.CircleShape
import androidx.compose.foundation.shape.RoundedCornerShape
import androidx.compose.material.icons.Icons
import androidx.compose.material.icons.filled.Add
import androidx.compose.material.icons.filled.Delete
import androidx.compose.material3.BottomAppBar
import androidx.compose.material3.BottomAppBarDefaults
import androidx.compose.material3.Card
import androidx.compose.material3.FloatingActionButton
import androidx.compose.material3.FloatingActionButtonDefaults
import androidx.compose.material3.Icon
import androidx.compose.material3.IconButton
import androidx.compose.material3.MaterialTheme
import androidx.compose.material3.Scaffold
import androidx.compose.material3.SwipeToDismissBox
import androidx.compose.material3.SwipeToDismissBoxValue
import androidx.compose.material3.Text
import androidx.compose.material3.rememberSwipeToDismissBoxState
import androidx.compose.runtime.Composable
import androidx.compose.runtime.getValue
import androidx.compose.runtime.livedata.observeAsState
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.draw.clip
import androidx.compose.ui.draw.shadow
import androidx.compose.ui.graphics.Color
import androidx.compose.ui.layout.ContentScale
import androidx.compose.ui.res.painterResource
import androidx.compose.ui.text.style.TextOverflow
import androidx.compose.ui.tooling.preview.Devices
import androidx.compose.ui.tooling.preview.Preview
import androidx.compose.ui.unit.dp
import com.example.compose.LoginTheme
import com.example.login.R
import com.example.login.data.ContactoEntity
import com.example.login.model.ContactosViewModel


@Composable
fun ContactosLayout(onAddContacto: () -> Unit,
                    viewModel: ContactosViewModel,
                    modifier: Modifier = Modifier)
{
    val contactos by viewModel.allContactos.observeAsState(emptyList())
    Scaffold(
        bottomBar = { ContactosBottomBar(onAddContacto) }
    )
    { paddingValues ->
        ContactosList(contactos,
            onRemove = { contacto ->
                viewModel.delete(contacto)},
            modifier = modifier.padding(paddingValues))
    }
}

@Composable
fun ContactosBottomBar(
    onAddContacto: () -> Unit,
    modifier: Modifier = Modifier)
{
    BottomAppBar(
        actions = {
            IconButton(onClick = { /* Perfil */})
            {
                Image(
                    painter = painterResource(R.drawable.alpelowachin),
                    contentScale = ContentScale.Crop,
                    contentDescription = null,
                )
            }
        },
            floatingActionButton = {
                FloatingActionButton(
                    onClick = { onAddContacto() },
                    containerColor = BottomAppBarDefaults.bottomAppBarFabColor,
                    elevation = FloatingActionButtonDefaults.bottomAppBarFabElevation()
                ) {
                    Icon(Icons.Filled.Add, null)
                }
            },
        modifier = modifier.shadow(elevation = 30.dp))
}

@Composable
fun ContactosList(contactos : List<ContactoEntity>,
                  onRemove: (ContactoEntity) -> Unit,
                  modifier: Modifier)
{
    LazyColumn(
        horizontalAlignment = Alignment.CenterHorizontally,
        verticalArrangement = Arrangement.Top,
        modifier = modifier
            .fillMaxSize()
            .statusBarsPadding()
    ) {
        items(contactos,
            // Key permite que lazy column borre items segun su key, no su index
            key = {contacto -> contacto.idContacto})
        {
            contacto ->
            SwipeBox(
                contactoSwipe = contacto,
                onRemove = onRemove,
                modifier = Modifier.animateItem()
            )
        }
    }
}

@Composable
private fun ContactoCard(contacto: ContactoEntity, modifier: Modifier)
{
    Card(
        modifier = modifier
            .padding()
            .fillMaxSize(),

    ){
        Row(
            verticalAlignment = Alignment.CenterVertically,
            modifier = Modifier
                .padding(horizontal = 16.dp, vertical = 8.dp)
                .fillMaxWidth()
        ) {
            Image(
                painter = painterResource(R.drawable.darwin),
                contentDescription = contacto.nombre,
                contentScale = ContentScale.Crop,
                modifier = Modifier
                    .size(68.dp)
                    .aspectRatio(1f)
                    .clip(CircleShape)

            )
            Text(
                text = contacto.nombre,
                style = MaterialTheme.typography.headlineSmall,
                maxLines = 1,
                overflow = TextOverflow.Ellipsis,
                modifier = Modifier.padding(16.dp)

            )
        }
    }
}

@Composable
fun SwipeBox(
    contactoSwipe: ContactoEntity,
    onRemove : (ContactoEntity) -> Unit,
    modifier: Modifier = Modifier,
)
{
    val swipeToDismissBoxState = rememberSwipeToDismissBoxState(
        confirmValueChange = { newValue ->
            if(newValue == SwipeToDismissBoxValue.EndToStart){
                onRemove(contactoSwipe)
                true
            } else {
                false
            }
        },
        // Swipea POR LO MENOS 50% de la barra
        positionalThreshold = {
            totalDistance ->
            totalDistance * 0.5f
        }
    )

    SwipeToDismissBox(
        state = swipeToDismissBoxState,
        modifier = modifier
            .fillMaxSize(0.9f)
            .padding(top = 16.dp),
        backgroundContent = {
            if (swipeToDismissBoxState.dismissDirection == SwipeToDismissBoxValue.EndToStart)
            {
                    Icon(
                        imageVector = Icons.Default.Delete,
                        contentDescription = "Remove item",
                        modifier = Modifier
                            .background(
                                Color.Red,
                                shape = RoundedCornerShape(16.dp)
                            )
                            .fillMaxSize()
                            .padding(end = 8.dp)
                            .wrapContentSize(Alignment.CenterEnd),
                        tint = Color.White
                    )
                }
        },
        enableDismissFromStartToEnd = false,

        content = { ContactoCard(contactoSwipe, modifier) }

    )

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
        //ContactosLayout()
    }
}