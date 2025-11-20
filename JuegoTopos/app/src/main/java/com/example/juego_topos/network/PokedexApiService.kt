package com.example.juego_topos.network

import com.example.juego_topos.network.serializables.ListaPokemonDataModel
import com.example.juego_topos.network.serializables.PokemonDetailDataModel
import okhttp3.OkHttpClient
import retrofit2.Response
import retrofit2.Retrofit
import retrofit2.converter.gson.GsonConverterFactory
import retrofit2.http.GET
import retrofit2.http.Path
import retrofit2.http.Query

interface PokedexApiService {
    @GET("pokemon")
    suspend fun getPokemonList(
        @Query("offset") offset: Int,
        @Query("limit") limit: Int) : Response<ListaPokemonDataModel>

    @GET("pokemon/{nombre}")
    suspend fun getPokemonDetail(
        @Path("nombre") nombre: String) : PokemonDetailDataModel


    fun getRetroFitClient(): PokedexApiService
    {
        val retrofit = Retrofit.Builder()
            .baseUrl("https://pokeapi.co/api/v2/")
            .addConverterFactory(GsonConverterFactory.create())
            .client(OkHttpClient())
            .build()
        return retrofit.create(PokedexApiService::class.java)
    }
}

