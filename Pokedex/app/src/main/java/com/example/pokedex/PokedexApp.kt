package com.example.pokedex

import android.os.Build
import androidx.annotation.RequiresExtension
import androidx.compose.foundation.layout.Arrangement
import androidx.compose.foundation.layout.Column
import androidx.compose.foundation.layout.Row
import androidx.compose.foundation.layout.Spacer
import androidx.compose.foundation.layout.fillMaxSize
import androidx.compose.foundation.layout.fillMaxWidth
import androidx.compose.foundation.layout.height
import androidx.compose.foundation.layout.padding
import androidx.compose.foundation.layout.size
import androidx.compose.foundation.layout.statusBarsPadding
import androidx.compose.foundation.layout.width
import androidx.compose.foundation.lazy.LazyColumn
import androidx.compose.foundation.lazy.items
import androidx.compose.foundation.shape.RoundedCornerShape
import androidx.compose.material3.Card
import androidx.compose.material3.CardDefaults
import androidx.compose.material3.MaterialTheme
import androidx.compose.material3.Text
import androidx.compose.runtime.Composable
import androidx.compose.runtime.LaunchedEffect
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.layout.ContentScale
import androidx.compose.ui.text.font.FontWeight
import androidx.compose.ui.unit.dp
import coil3.compose.AsyncImage
import com.example.pokedex.model.PokemonData
import com.example.pokedex.model.PokemonUiState
import com.example.pokedex.model.PokemonViewmodel
import com.example.pokedex.model.Result


@RequiresExtension(extension = Build.VERSION_CODES.S, version = 7)
@Composable
fun HomeScreen(
    viewmodel: PokemonViewmodel,
    modifier: Modifier = Modifier,
) {
    var pokemonUiState = viewmodel.pokemonUiState
    when (pokemonUiState) {
        is PokemonUiState.Loading -> PantallaLoading(modifier = modifier.fillMaxSize())
        is PokemonUiState.Success -> {
            PantallaExito(pokemonUiState.pokemon, viewmodel, modifier = modifier.fillMaxSize())
        }
        is PokemonUiState.Error -> PantallaError(modifier = modifier.fillMaxSize())
    }
}

@Composable
fun PantallaLoading(modifier: Modifier) {
    Text(
        text = "cargando"
    )
}

@RequiresExtension(extension = Build.VERSION_CODES.S, version = 7)
@Composable
fun PantallaExito(pokemonList: List<Result>, viewModel: PokemonViewmodel, modifier: Modifier) {
    PokemonList(pokemonList, viewModel, modifier)
}

@Composable
fun PantallaError(modifier: Modifier) {
    Text(
        text = "error"
    )
}

@Composable
fun CartaPokemon(pokemon : Result, pokemonDetalle : PokemonData?)
{
    val pokemonId = pokemon.url.trimEnd('/').split('/').lastOrNull() ?: "0"
    val imageUrl = "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/$pokemonId.png"
    Card(
        modifier = Modifier.fillMaxWidth(),
        shape = RoundedCornerShape(12.dp),
        elevation = CardDefaults.cardElevation(defaultElevation = 4.dp)
    ) {
        Row(
            modifier = Modifier
                .fillMaxWidth()
                .padding(16.dp),
            verticalAlignment = Alignment.CenterVertically
        ) {
            AsyncImage(
                model = imageUrl,
                contentDescription = pokemon.name,
                modifier = Modifier.size(80.dp),
                contentScale = ContentScale.Fit
            )

            Spacer(modifier = Modifier.width(16.dp))

            Column(
                modifier = Modifier.weight(1f)
            ) {
                Text(
                    text = "#${pokemonId.padStart(3, '0')}",
                    style = MaterialTheme.typography.bodySmall,
                    color = MaterialTheme.colorScheme.onSurfaceVariant
                )

                Text(
                    text = pokemon.name.replaceFirstChar { it.uppercase() },
                    style = MaterialTheme.typography.titleLarge,
                    fontWeight = FontWeight.Bold
                )

                // Mostrar tipos si están disponibles los detalles
                pokemonDetalle?.let { detail ->
                    Spacer(modifier = Modifier.height(8.dp))
                    Row(
                        horizontalArrangement = Arrangement.spacedBy(8.dp)
                    ) {
                        detail.types.forEach { type ->
                            mostrarTipo(type.type.name)
                        }
                    }
                }
            }
        }
    }
}

@Composable
fun mostrarTipo(tipo : String)
{
    Text(
        text = tipo.replaceFirstChar { it.uppercase() },
        modifier = Modifier.padding(horizontal = 12.dp, vertical = 4.dp),
        style = MaterialTheme.typography.bodySmall,
        color = MaterialTheme.colorScheme.onPrimaryContainer
    )
}



@RequiresExtension(extension = Build.VERSION_CODES.S, version = 7)
@Composable
fun PokemonList(pokemonList : List<Result>,
                viewmodel: PokemonViewmodel,
                modifier: Modifier) {
    LazyColumn(

        horizontalAlignment = Alignment.CenterHorizontally,
        verticalArrangement = Arrangement.Top,
        modifier = modifier
            .fillMaxSize()
            .statusBarsPadding()
    )
    {
        items(
            items = pokemonList,
            key = { it.url }
        ) { pokemon ->
            // Cargar detalles cuando el item se hace visible
            LaunchedEffect(pokemon.url) {
                viewmodel.loadPokemonDetails(pokemon.url)
            }

            CartaPokemon(
                pokemon = pokemon,
                pokemonDetalle = viewmodel.pokemonDetailsCache[pokemon.url]
            )
        }
    }
}

