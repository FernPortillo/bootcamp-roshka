package com.example.juego_topos.model

import android.util.Log
import androidx.compose.runtime.getValue
import androidx.compose.runtime.mutableStateOf
import androidx.compose.runtime.setValue
import androidx.lifecycle.ViewModel
import androidx.lifecycle.ViewModelProvider
import androidx.lifecycle.viewModelScope
import com.example.juego_topos.data.entities.UsuarioEntity
import com.example.juego_topos.repository.UsersRepository
import kotlinx.coroutines.launch


sealed interface AuthUIState
{
    object Idle : AuthUIState
    object Exito : AuthUIState
    object Error : AuthUIState
}

class AuthViewmodel (private val repository: UsersRepository) : ViewModel()
{
    // Login
    var user by mutableStateOf("")
    var password by mutableStateOf("")

    // Registro
    var regUser by mutableStateOf("")
        private set
    var regPassword by mutableStateOf("")
        private set

    var uiStateLogin by mutableStateOf<AuthUIState>(AuthUIState.Idle)
        private set
    var uiStateReg by mutableStateOf<AuthUIState>(AuthUIState.Idle)

    fun updateRegUser(user : String) { this.regUser = user }
    fun updateRegPass(pass : String) { this.regPassword = pass }

    fun updateLoginUser(user : String) { this.user = user }
    fun updateLoginPass(pass : String) { this.password = pass }


    fun onButtonRegisterClick()
    {
        viewModelScope.launch{
            if (regUser.isBlank() || regPassword.isBlank()) {
                uiStateReg = AuthUIState.Error
                // TODO Tirar error de coso vacio
                Log.d("registro", "ESTE REGISTRO ESTA VACIO")

            }

            if (repository.checkIfUserExiste(regUser)) {
                uiStateReg = AuthUIState.Error
                // TODO tirar error de registro ya existente
                Log.d("registro", "ESTE REGISTRO YA EXISTE")
            } else {
                repository.registrar(UsuarioEntity(regUser, regPassword))
                uiStateReg = AuthUIState.Exito
                updateRegUser("")
                updateRegPass("")
            }
        }
    }

    fun onButtonLoginClick()
    {
        viewModelScope.launch{
            if (user.isBlank() || password.isBlank()) {
                uiStateLogin = AuthUIState.Error
                // TODO Tirar error de coso vacio
                Log.d("tag", "user vacio")
                return@launch
            }

            if (repository.checkLogin(user, password)) {
                uiStateLogin = AuthUIState.Exito
                Log.d("tag2", "exito en el login")
            } else {
                uiStateLogin = AuthUIState.Error
                Log.d("login", "USER O PASS INCORRECTO")
            }
        }
    }
    
    fun resetLoginState() { uiStateLogin = AuthUIState.Idle }
}

class AuthViewmodelFactory(private val repository: UsersRepository): ViewModelProvider.Factory
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