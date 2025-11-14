package com.example.login.model

import androidx.compose.runtime.getValue
import androidx.compose.runtime.mutableStateOf
import androidx.compose.runtime.setValue
import androidx.lifecycle.ViewModel
import com.example.login.data.CredencialesUser
import com.example.login.data.SharedPrefsRepository


sealed interface RegistroUiState
{
    data object Idle : RegistroUiState
    data object Exito : RegistroUiState
    data object Error : RegistroUiState
}
class RegisterViewModel(private val sharedPrefs : SharedPrefsRepository) : ViewModel()
{
    // Solo logica del register, controlar si esta vacio y guardar rptas
    var email by mutableStateOf("")
        private set
    var userName by mutableStateOf("")
        private set
    var pass by mutableStateOf("")
        private set

    var uiState by mutableStateOf<RegistroUiState>(RegistroUiState.Idle)
        private set


    fun actualizarEmail(email: String)
    {
        this.email = email
    }

    fun actualizarUser(user: String)
    {
        this.userName = user
    }

    fun actualizarPass(pass : String)
    {
        this.pass = pass
    }

    fun onRegisterClick() {
        if (email.isBlank() || pass.isBlank()) {
            uiState = RegistroUiState.Error
        } else {
            sharedPrefs.saveUser(
                CredencialesUser(
                    email,
                    userName,
                    pass
                )
            )
            uiState = RegistroUiState.Exito
        }
    }

    fun resetState()
    {
        uiState = RegistroUiState.Idle
    }}