package com.example.juego_topos.repository

import android.app.Application
import com.example.juego_topos.data.PuntajesDataBase
import com.example.juego_topos.data.SharedPreferences
import kotlinx.coroutines.CoroutineScope
import kotlinx.coroutines.SupervisorJob

class MyApplication : Application()
{
    val appScope = CoroutineScope(SupervisorJob())
    val sharedPreferences : SharedPreferences by lazy()
    {
        SharedPreferences(applicationContext)
    }
    val puntajesDB : PuntajesDataBase by lazy()
    {
        PuntajesDataBase.getDatabase(applicationContext, appScope)
    }
    val puntajesRepository : PuntajesRepository by lazy()
    {
        PuntajesRepository(puntajesDB.puntajeDao())
    }
}