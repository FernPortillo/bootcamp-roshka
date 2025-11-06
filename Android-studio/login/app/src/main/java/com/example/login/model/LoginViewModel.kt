package com.example.login.model

import androidx.compose.runtime.getValue
import androidx.compose.runtime.mutableStateOf
import androidx.compose.runtime.setValue
import androidx.lifecycle.ViewModel
import com.example.login.data.SharedPrefsRepository

sealed interface LoginUiState
{
    object Idle : LoginUiState
    object Exito : LoginUiState
    object Error : LoginUiState
}
class LoginViewModel(private val sharedPrefs : SharedPrefsRepository) : ViewModel() {
    var email by mutableStateOf("")
    var pass by mutableStateOf("")

    var uiState by mutableStateOf<LoginUiState>(LoginUiState.Idle)

    fun onLoginButtonClick() {
        val emailGuardado = sharedPrefs.getUserMail()
        val passGuardada = sharedPrefs.getUserPass()


        if (email.isBlank() || pass.isBlank()) {
            // Llamar error
            uiState = LoginUiState.Error
            return
        }

        if (email == emailGuardado && pass == passGuardada) {
            // Login exitoso
            uiState = LoginUiState.Exito
        } else {
            // Login fallido
            uiState = LoginUiState.Error
            return
        }
    }
    fun ponerIdle()
    {
        uiState = LoginUiState.Idle
    }


}