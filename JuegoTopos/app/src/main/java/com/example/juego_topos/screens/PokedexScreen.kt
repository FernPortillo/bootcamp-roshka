package com.example.juego_topos.screens

import androidx.compose.foundation.lazy.LazyColumn
import androidx.compose.material3.Card
import androidx.compose.material3.Text
import androidx.compose.runtime.Composable
import androidx.compose.runtime.LaunchedEffect
import androidx.compose.runtime.collectAsState
import com.example.juego_topos.model.ListaPokemonViewModel


@Composable
fun LayoutPokedex(listViewModel : ListaPokemonViewModel, onPokemonNavigate :(nombre: String) -> Unit)
{
    val listaPokemon = listViewModel.listaPokemon.collectAsState()

    LaunchedEffect(listaPokemon)
    {
        listViewModel.getListaPokemon()
    }

    LazyColumn {
        listaPokemon.value?.let {results ->
            items(results.results.size) { index ->
                val name = results.results[index].name
                CardPokemon(name, onPokemonNavigate)
            }
        }
    }
}

@Composable
fun CardPokemon(pokemon : String, onPokemonNavigate: (nombre: String) -> Unit)
{
    Card(onClick = { onPokemonNavigate(pokemon) })
    { Text(pokemon) }
}



