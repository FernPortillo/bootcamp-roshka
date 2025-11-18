package com.example.juego_topos.model

import androidx.compose.runtime.getValue
import androidx.compose.runtime.mutableStateOf
import androidx.compose.runtime.setValue
import androidx.lifecycle.ViewModel
import androidx.lifecycle.ViewModelProvider
import com.example.juego_topos.data.Credenciales
import com.example.juego_topos.repository.SharedPrefsRepository


sealed interface AuthUIState
{
    object Idle : AuthUIState
    object Exito : AuthUIState
    object Error : AuthUIState
}

class AuthViewmodel (private val repository: SharedPrefsRepository) : ViewModel()
{
    // Login
    val user by mutableStateOf("")
    val password by mutableStateOf("")

    // Registro
    var regUser by mutableStateOf("")
        private set
    var regPassword by mutableStateOf("")
        private set

    var uiStateLogin by mutableStateOf<AuthUIState>(AuthUIState.Idle)
        private set
    var uiStateReg by mutableStateOf<AuthUIState>(AuthUIState.Idle)

    fun updateUser(user : String) { this.regUser = user }
    fun updatePass(pass : String) { this.regPassword = pass }

    fun onButtonRegisterClick()
    {
        if (regUser.isBlank() || regPassword.isBlank())
        {
            uiStateReg = AuthUIState.Error
            // TODO Tirar error de coso vacio
        }
        else
        {
            repository.saveUser(
                Credenciales(
                    regUser,
                    regPassword
                )
            )
            uiStateReg = AuthUIState.Exito
        }
    }

    fun onButtonLoginClick()
    {
        if (user.isBlank() || password.isBlank())
        {
            uiStateLogin = AuthUIState.Error
            // TODO Tirar error de coso vacio
        }

        val userSaved = repository.getUsername()
        val passSaved = repository.getPassword()

        uiStateLogin = if (userSaved == user && passSaved == password) AuthUIState.Exito
        else AuthUIState.Error
    }
    
    fun resetState() = { uiStateLogin = AuthUIState.Idle }
}

class AuthViewmodelFactory(private val repository: SharedPrefsRepository): ViewModelProvider.Factory
{
    override fun <T : ViewModel> create(modelClass: Class<T>): T {
        if (modelClass.isAssignableFrom(AuthViewmodel::class.java))
        {
            @Suppress("UNCHECKED_CAST")
            return AuthViewmodel(repository) as T
        }
        throw IllegalArgumentException("Clase de Viewmodel Desconocido")
    }
}