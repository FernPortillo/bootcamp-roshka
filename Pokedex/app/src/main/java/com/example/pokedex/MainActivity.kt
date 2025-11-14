package com.example.pokedex

import android.os.Bundle
import androidx.lifecycle.viewmodel.compose.viewModel
import androidx.activity.ComponentActivity
import androidx.activity.compose.setContent
import androidx.activity.enableEdgeToEdge
import androidx.compose.foundation.layout.PaddingValues
import androidx.compose.foundation.layout.fillMaxSize
import androidx.compose.foundation.layout.fillMaxWidth
import androidx.compose.foundation.layout.padding
import androidx.compose.material3.Scaffold
import androidx.compose.material3.Text
import androidx.compose.runtime.Composable
import androidx.compose.ui.Modifier
import androidx.compose.ui.tooling.preview.Preview
import androidx.compose.ui.unit.dp
import com.example.pokedex.model.PokemonUiState
import com.example.pokedex.model.PokemonViewmodel
import com.example.pokedex.ui.theme.PokedexTheme

class MainActivity : ComponentActivity() {
    override fun onCreate(savedInstanceState: Bundle?) {

        super.onCreate(savedInstanceState)
        enableEdgeToEdge()
        setContent {
            PokedexTheme {
                Scaffold(modifier = Modifier.fillMaxSize()) { innerPadding ->
                    PokemonApp()
                }
            }
        }
    }
}

@Composable
fun PokemonApp() {
    val pokemonViewmodel: PokemonViewmodel =
        viewModel(factory = PokemonViewmodel.Factory)
    HomeScreen(
        pokemonUiState = pokemonViewmodel.pokemonUiState,
    )
}


@Composable
fun HomeScreen(
    pokemonUiState: PokemonUiState,
    modifier: Modifier = Modifier,
) {
    when (pokemonUiState) {
        is PokemonUiState.Loading -> PantallaLoading(modifier = modifier.fillMaxSize())
        is PokemonUiState.Success -> PantallaExito(
            pokemonUiState.pokemon, modifier = modifier.fillMaxWidth()
        )
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


@Preview(showBackground = true)
@Composable
fun GreetingPreview() {
    PokedexTheme {
        PokemonApp()
    }
}