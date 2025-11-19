package com.example.pokedex.data

import com.example.pokedex.model.PokemonAPI
import com.example.pokedex.model.PokemonData
import com.example.pokedex.network.PokemonApiService


interface PokemonRepository
{
    suspend fun getPokemon() : PokemonAPI
    suspend fun getPokemonByUrl(url: String): PokemonData
}

class NetworkPokemonApiRepository(
    private val pokemonApiService: PokemonApiService): PokemonRepository
{
    override suspend fun getPokemon(): PokemonAPI = pokemonApiService.getPokemonList()
    override suspend fun getPokemonByUrl(url: String): PokemonData = pokemonApiService.getPokemonByUrl(url)

}