package com.example.juego_topos.repository

import com.example.juego_topos.data.Credenciales
import com.example.juego_topos.data.SharedPreferences

class SharedPrefsRepository(private val sharedPreferences: SharedPreferences)
{
    fun saveUser(credenciales: Credenciales)
    {
        sharedPreferences.saveUser(credenciales)
    }

    fun getUsername() : String?
    {
        return sharedPreferences.getUsername()
    }

    fun getPassword() : String?
    {
        return sharedPreferences.getPassword()
    }
}