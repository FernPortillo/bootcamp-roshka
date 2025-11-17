package com.example.pokedex.network

import com.example.pokedex.model.PokemonAPI
import com.example.pokedex.model.PokemonData
import kotlinx.serialization.json.Json
import com.jakewharton.retrofit2.converter.kotlinx.serialization.asConverterFactory
import okhttp3.MediaType.Companion.toMediaType
import retrofit2.Retrofit
import retrofit2.http.GET
import retrofit2.http.Path

interface PokemonApiService {
    @GET("?limit=151")
    suspend fun getPokemon(): PokemonAPI

    // getpokemonbyname
    @GET("{nombre}")
    suspend fun getPokemonByName(@Path("nombre") nombre: String): PokemonData

    // getpokemonbynumber
    @GET("{id}")
    suspend fun getPokemonById(@Path("id") id: String): PokemonData

}