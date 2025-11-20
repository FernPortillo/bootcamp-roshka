package com.example.juego_topos.repository

import android.app.Application
import com.example.juego_topos.data.database.AppDataBase
import kotlinx.coroutines.CoroutineScope
import kotlinx.coroutines.SupervisorJob

class MyApplication : Application()
{
    val appScope = CoroutineScope(SupervisorJob())
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
}