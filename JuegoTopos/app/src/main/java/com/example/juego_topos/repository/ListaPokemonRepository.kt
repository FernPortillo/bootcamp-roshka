package com.example.juego_topos.repository

import android.util.Log
import com.example.juego_topos.network.PokedexApiService
import com.example.juego_topos.network.serializables.ListaPokemonDataModel
import retrofit2.Response


interface PokemonRepository
{
    suspend fun getPokemon(offset: Int, limit: Int) : Response<ListaPokemonDataModel>
}

class NetworkPokemonApiRepository(
    private val pokemonApiService: PokedexApiService): PokemonRepository
{
    override suspend fun getPokemon(offset : Int, limit : Int): Response<ListaPokemonDataModel>
    {
        Log.d("Repository getPokemonList", "$offset, $limit")
        return pokemonApiService.getPokemonList(offset = offset, limit = limit)
    }

}

