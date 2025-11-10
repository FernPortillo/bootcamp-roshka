package com.example.login.model

import android.util.Patterns
import androidx.compose.runtime.getValue
import androidx.compose.runtime.mutableStateOf
import androidx.compose.runtime.setValue
import androidx.lifecycle.ViewModel
import com.example.login.R
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
    var errorCode : Int = 0

    fun onLoginButtonClick() {
        val emailGuardado = sharedPrefs.getUserMail()
        val passGuardada = sharedPrefs.getUserPass()


        if (email.isBlank() || pass.isBlank()) {
            // Llamar error
            uiState = LoginUiState.Error
            errorCode =  R.string.error_correo_pass_vacio
        }
        if (email == emailGuardado && pass == passGuardada) {
            // Login exitoso
            uiState = LoginUiState.Exito
            errorCode =  0
        }
        else {
            // Login fallido
            uiState = LoginUiState.Error
            errorCode = R.string.error_input_incorrecto
        }
    }
    fun resetState()
    {
        uiState = LoginUiState.Idle
    }


}