package com.example.pokedex.data

import com.example.pokedex.model.PokemonAPI
import com.example.pokedex.model.PokemonData
import com.example.pokedex.network.PokemonApiService


interface PokemonRepository
{
    suspend fun getPokemon() : PokemonAPI
    suspend fun getPokemonByName(nombrePokemon: String): PokemonData
    suspend fun getPokemonById(idPokemon: String): PokemonData
}

class NetworkPokemonApiRepository(
    private val pokemonApiService: PokemonApiService): PokemonRepository
{
    override suspend fun getPokemon(): PokemonAPI = pokemonApiService.getPokemon()
    override suspend fun getPokemonByName(nombrePokemon: String): PokemonData = pokemonApiService.getPokemonByName(nombrePokemon)
    override suspend fun getPokemonById(idPokemon: String): PokemonData = pokemonApiService.getPokemonById(idPokemon)
}