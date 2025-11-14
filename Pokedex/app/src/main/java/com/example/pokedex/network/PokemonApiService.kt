package com.example.pokedex.network

import com.example.pokedex.model.PokemonAPI
import kotlinx.serialization.json.Json
import com.jakewharton.retrofit2.converter.kotlinx.serialization.asConverterFactory
import okhttp3.MediaType.Companion.toMediaType
import retrofit2.Retrofit
import retrofit2.http.GET

interface PokemonApiService {
    @GET("?limit=151")
    suspend fun getPokemon(): PokemonAPI

    // getpokemonbyurl

    // getpokemonbyname


}