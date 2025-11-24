package com.example.juego_topos.repository

import android.util.Log
import com.example.juego_topos.network.PokedexApiService
import com.example.juego_topos.network.serializables.ListaPokemonDataModel
import com.example.juego_topos.network.serializables.PokemonDetailDataModel
import retrofit2.Response

interface PokemonDetailsRepository{
    suspend fun getPokemonDetails(name: String): Response<PokemonDetailDataModel>
}

class NetworkPokemonDetailsApiRepository(private val pokemonApiService: PokedexApiService): PokemonDetailsRepository
{
    override suspend fun getPokemonDetails(name: String): Response<PokemonDetailDataModel>
    {
        Log.d("Repository getPokemonList", "$name")
        return pokemonApiService.getPokemonDetail(name)

    }
}