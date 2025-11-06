package com.example.login.model

import androidx.compose.runtime.getValue
import androidx.compose.runtime.mutableStateOf
import androidx.compose.runtime.setValue
import androidx.lifecycle.ViewModel
import com.example.login.data.SharedPrefsRepository

class RegisterViewModel(private val sharedPrefs : SharedPrefsRepository) : ViewModel()
{
    // Solo logica del register, controlar si esta vacio y guardar rptas
    var email by mutableStateOf("")
    var pass by mutableStateOf("")
    var mostrarDialogSuccess by mutableStateOf(false)
    var mostrarDialogError by mutableStateOf(false)

    fun onRegisterClick() {
        if (email.isBlank() || pass.isBlank()) {
            mostrarDialogError = true
        } else {
            sharedPrefs.saveUser(email, pass)
            mostrarDialogSuccess = true

        }
    }
}