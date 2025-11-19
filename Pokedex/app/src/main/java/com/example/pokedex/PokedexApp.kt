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
import androidx.compose.runtime.LaunchedEffect
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.unit.dp
import androidx.lifecycle.viewmodel.compose.viewModel
import com.example.pokedex.model.PokemonAPI
import com.example.pokedex.model.PokemonData
import com.example.pokedex.model.PokemonUiState
import com.example.pokedex.model.PokemonViewmodel


@Composable
fun HomeScreen(
    viewmodel: PokemonViewmodel,
    modifier: Modifier = Modifier,
) {
    var pokemonUiState = viewmodel.pokemonUiState
    when (pokemonUiState) {
        is PokemonUiState.Loading -> PantallaLoading(modifier = modifier.fillMaxSize())
        is PokemonUiState.Success -> {
            LaunchedEffect(pokemonUiState.pokemon)
            {
                viewmodel.loadPokemonDetails(pokemonUiState.pokemon)
            }
            PantallaLoading(modifier = modifier.fillMaxSize())
        }
        is PokemonUiState.SuccessDetail -> PantallaExito(pokemonUiState.pokemonDetail, modifier = modifier.fillMaxWidth())
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
fun PantallaExito(pokemonList: List<PokemonData>, modifier: Modifier) {
    PokemonList(pokemonList)
}

@Composable
fun PantallaError(modifier: Modifier) {
    Text(
        text = "error"
    )
}

@Composable
fun CartaPokemon(pokemon : PokemonData)
{
    Card()
    {
        Text("$pokemon.species.name")
    }
}

@Composable
fun PokemonList(pokemonList : List<PokemonData>,
                modifier: Modifier) {
    LazyColumn(

        horizontalAlignment = Alignment.CenterHorizontally,
        verticalArrangement = Arrangement.Top,
        modifier = modifier
            .fillMaxSize()
            .statusBarsPadding()
    )
    {
        items(pokemon) pokemonList ->
        CartaPokemon(
            pokemon = pokemon,
        )
    }
}

