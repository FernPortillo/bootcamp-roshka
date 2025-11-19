package com.example.pokedex.network

import com.example.pokedex.model.PokemonAPI
import com.example.pokedex.model.PokemonData
import retrofit2.http.GET
import retrofit2.http.Query
import retrofit2.http.Url

interface PokemonApiService {
    @GET("pokemon")
    suspend fun getPokemonList(
        @Query("limit") limit: Int = 9
    ): PokemonAPI

    @GET()
    suspend fun getPokemonByUrl(@Url url: String): PokemonData
}