package com.example.juego_topos.data

import android.content.Context
import android.content.SharedPreferences
import androidx.core.content.edit

data class Credenciales(val nombre : String, val pass : String)
class SharedPreferences(context : Context)
{
    private val sharedPrefs : SharedPreferences =
        context.getSharedPreferences("my_sp", Context.MODE_PRIVATE)

    fun saveUser(credenciales: Credenciales)
    {
        sharedPrefs.edit {
            putString(KEY_USERNAME, credenciales.nombre)
            putString(KEY_PASSWORD, credenciales.pass)
        }
    }

    fun getUsername() : String?
    {
        return sharedPrefs.getString(KEY_USERNAME, null)
    }

    fun getPassword() : String?
    {
        return sharedPrefs.getString(KEY_PASSWORD, null)
    }



    companion object
    {
        private const val KEY_USERNAME = "nombre_user"
        private const val KEY_PASSWORD = "pass_user"
    }
}