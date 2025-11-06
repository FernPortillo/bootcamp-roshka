package com.example.login.data

import android.content.Context
import android.content.SharedPreferences

class SharedPrefsRepository (context : Context)
{
    private val sharedPref : SharedPreferences =
        context.getSharedPreferences("my_sp", Context.MODE_PRIVATE)


    fun saveUser(email : String, pass : String)
    {
        val editor = sharedPref.edit()
        editor.putString("mail_user", email)
        editor.putString("pass_user", pass)
        editor.apply()
    }

    fun getUserMail(): String?
    {
        return sharedPref.getString("mail_user", null)
    }

    fun getUserPass(): String?
    {
        return sharedPref.getString("pass_user", null)
    }

}