package com.example.juego_topos.repository

import android.app.Application
import com.example.juego_topos.data.database.AppDataBase
import com.example.juego_topos.network.PokedexApiService
import kotlinx.coroutines.CoroutineScope
import kotlinx.coroutines.SupervisorJob
import okhttp3.OkHttpClient
import retrofit2.Retrofit
import retrofit2.converter.gson.GsonConverterFactory

class MyApplication : Application()
{
    val appScope = CoroutineScope(SupervisorJob())




    private val retrofit = Retrofit.Builder()
        .baseUrl("https://pokeapi.co/api/v2/")
        .addConverterFactory(GsonConverterFactory.create())
        .client(OkHttpClient())
        .build()

    private val retrofitService by lazy()
    {
        retrofit.create(PokedexApiService::class.java)
    }
    val appDB : AppDataBase by lazy()
    {
        AppDataBase.getDatabase(applicationContext, appScope)
    }
    val puntajesRepository : PuntajesRepository by lazy()
    {
        PuntajesRepository(appDB.puntajeDao())
    }
    val usersRepository : UsersRepository by lazy()
    {
        UsersRepository(appDB.usersDao())
    }

    val listaPokemonRepository : PokemonRepository by lazy()
    {
        NetworkPokemonApiRepository(retrofitService)
    }
    val pokemonDetailRepository : PokemonDetailsRepository by lazy()
    {
        NetworkPokemonDetailsApiRepository(retrofitService)
    }
}