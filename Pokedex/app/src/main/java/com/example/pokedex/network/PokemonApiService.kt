package com.example.pokedex.network

import com.example.pokedex.model.PokemonAPI
import com.example.pokedex.model.PokemonData
import kotlinx.serialization.json.Json
import com.jakewharton.retrofit2.converter.kotlinx.serialization.asConverterFactory
import kotlinx.coroutines.flow.Flow
import okhttp3.MediaType.Companion.toMediaType
import retrofit2.Retrofit
import retrofit2.http.GET
import retrofit2.http.Path
import retrofit2.http.Query

interface PokemonApiService {
    @GET("pokemon")
    suspend fun getPokemon(
        @Query("limit") limit: Int = 151): PokemonAPI

    // getpokemonbyname
    @GET("pokemon/{nombre}")
    suspend fun getPokemonByName(@Path("nombre") nombre: String): PokemonData

    // getpokemonbynumber
    @GET("pokemon/{id}")
    suspend fun getPokemonById(@Path("id") id: String): PokemonData

}