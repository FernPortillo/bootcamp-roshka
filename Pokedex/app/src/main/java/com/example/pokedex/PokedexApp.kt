package com.example.pokedex

import androidx.compose.foundation.layout.Arrangement
import androidx.compose.foundation.layout.Row
import androidx.compose.foundation.layout.fillMaxSize
import androidx.compose.foundation.layout.fillMaxWidth
import androidx.compose.foundation.layout.padding
import androidx.compose.foundation.layout.statusBarsPadding
import androidx.compose.foundation.lazy.LazyColumn
import androidx.compose.material3.Card
import androidx.compose.material3.Text
import androidx.compose.runtime.Composable
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.unit.dp
import com.example.pokedex.model.PokemonAPI
import com.example.pokedex.model.PokemonUiState


@Composable
fun HomeScreen(
    pokemonUiState: PokemonUiState,
    modifier: Modifier = Modifier,
) {
    when (pokemonUiState) {
        is PokemonUiState.Loading -> PantallaLoading(modifier = modifier.fillMaxSize())
        is PokemonUiState.SuccessList -> PantallaExito(
            "${pokemonUiState.pokemon.results.size}",
            modifier = modifier.fillMaxWidth()
        )
        is PokemonUiState.SuccessDetail -> PantallaExito(pokemonUiState.pokemon.species.name, modifier = modifier.fillMaxWidth())
        is PokemonUiState.Error -> PantallaError(modifier = modifier.fillMaxSize())
    }
}

@Composable
fun PantallaLoading(modifier: Modifier) {
    Text(
        text = "cargando"
    )
}

@Composable
fun PantallaExito(pokemon: String, modifier: Modifier) {
    Text(
        text = pokemon
    )
}

@Composable
fun PantallaError(modifier: Modifier) {
    Text(
        text = "error"
    )
}

@Composable
fun CartaPokemon(pokemon : PokemonAPI)
{
    Card()
    {
        Text("${pokemon.results}")
    }
}

@Composable
fun PokemonList(pokemon : PokemonAPI,
                modifier: Modifier)
{
    LazyColumn(

        horizontalAlignment = Alignment.CenterHorizontally,
        verticalArrangement = Arrangement.Top,
        modifier = modifier
            .fillMaxSize()
            .statusBarsPadding()
    ) {
        val lista = pokemon.results
        }
}

