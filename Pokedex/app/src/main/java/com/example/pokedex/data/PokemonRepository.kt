package com.example.pokedex.data

import com.example.pokedex.model.PokemonAPI
import com.example.pokedex.network.PokemonApiService


interface PokemonRepository
{
    suspend fun getPokemon() : PokemonAPI
}

class NetworkPokemonApiRepository(
    private val pokemonApiService: PokemonApiService): PokemonRepository
{
    override suspend fun getPokemon(): PokemonAPI = pokemonApiService.getPokemon()
}