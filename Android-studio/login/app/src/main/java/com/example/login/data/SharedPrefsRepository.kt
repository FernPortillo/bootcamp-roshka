package com.example.login.data

import android.content.Context
import android.content.SharedPreferences
import java.io.File


data class CredencialesUser(val email: String, val userName: String, val pass: String)
class SharedPrefsRepository (context : Context)
{
    private val sharedPref : SharedPreferences =
        context.getSharedPreferences("my_sp", Context.MODE_PRIVATE)



    fun saveUser(credenciales : CredencialesUser)
    {
        val editor = sharedPref.edit()
        editor.putString(KEY_EMAIL, credenciales.email)
        editor.putString(KEY_USERNAME, credenciales.userName)
        editor.putString(KEY_PASSWORD, credenciales.pass)
        editor.apply()
    }

    fun getUserMail(): String?
    {
        return sharedPref.getString(KEY_EMAIL, null)
    }

    fun getUserName(): String?
    {
        return sharedPref.getString(KEY_USERNAME, null)
    }

    fun getUserPass(): String?
    {
        return sharedPref.getString(KEY_PASSWORD, null)
    }

    companion object
    {
        private const val KEY_EMAIL = "mail_user"
        private const val KEY_USERNAME = "nombre_user"
        private const val KEY_PASSWORD = "pass_user"
//        fun resetAppData(context: Context) {
//            // Borrar SharedPreferences
//            context.deleteSharedPreferences("my_sp")
//
//            // Borrar archivos internos y caché
//            context.filesDir.deleteRecursively()
//            context.cacheDir.deleteRecursively()
//        }

    }


}


