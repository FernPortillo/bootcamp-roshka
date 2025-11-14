package com.example.login.model

import android.util.Patterns
import androidx.lifecycle.LiveData
import androidx.lifecycle.ViewModel
import androidx.lifecycle.ViewModelProvider
import androidx.lifecycle.asLiveData
import androidx.lifecycle.viewModelScope
import com.example.login.data.ContactoEntity
import com.example.login.repository.ContactosRepository
import kotlinx.coroutines.flow.MutableStateFlow
import kotlinx.coroutines.flow.StateFlow
import kotlinx.coroutines.flow.asStateFlow
import kotlinx.coroutines.launch

class ContactosViewModel(private val repository: ContactosRepository) : ViewModel() {

    // Using LiveData and caching what allWords returns has several benefits:
    // - We can put an observer on the data (instead of polling for changes) and only update the
    //   the UI when the data actually changes.
    // - Repository is completely separated from the UI through the ViewModel.
    // LiveData clase de state que puede ser observada y envia aviso cuando cambia
    val allContactos: LiveData<List<ContactoEntity>> = repository.allContacts.asLiveData()

    // MutableStateFlow, stateFlow que avisa cuando cambia y Puede cambiar pq es mutable
    val _contactoNuevo = MutableStateFlow(NuevoContacto())
    val contactoNuevo : StateFlow<NuevoContacto> = _contactoNuevo.asStateFlow()


    fun updateNombre(nombre: String)
    {
        _contactoNuevo.value = _contactoNuevo.value.copy(nombre = nombre)
    }

    fun updateApellido(apellido: String)
    {
        _contactoNuevo.value = _contactoNuevo.value.copy(apellido = apellido)
    }

    fun updateEmail(email: String)
    {
        _contactoNuevo.value = _contactoNuevo.value.copy(email = email)
    }

    fun updateEdad(edad: String)
    {
        val edadToInt = edad.toIntOrNull()
        _contactoNuevo.value = _contactoNuevo.value.copy(edad = edadToInt)
    }


    // Validar contacto primero
    fun contactoEsValido(): Boolean
    {
        val contacto = _contactoNuevo.value
        return contacto.email.isNotBlank() && Patterns.EMAIL_ADDRESS.matcher(contacto.email).matches()
                && contacto.nombre.isNotBlank() && contacto.apellido.isNotBlank()
                && contacto.edad != null && contacto.edad > 0
    }

    // Guardar
    fun guardarContacto()
    {
        if (contactoEsValido())
        {
            val contacto = _contactoNuevo.value
            insert(
                ContactoEntity(
                    nombre = contacto.nombre,
                    apellido = contacto.apellido,
                    edad = contacto.edad!!,
                    email = contacto.email,
                    fotoUri = contacto.fotoUri
                )
            )
        }
    }

    fun limpiarFormulario()
    {
        _contactoNuevo.value = NuevoContacto()
    }
    /**
     * Launching a new coroutine to insert the data in a non-blocking way
     */
    fun insert(contacto: ContactoEntity) = viewModelScope.launch {
        repository.insert(contacto)
    }

    fun delete(contacto: ContactoEntity) = viewModelScope.launch {
        repository.delete(contacto)
    }

}

class ContactoViewModelFactory(private val repository: ContactosRepository) : ViewModelProvider.Factory {
    override fun <T : ViewModel> create(modelClass: Class<T>): T {
        if (modelClass.isAssignableFrom(ContactosViewModel::class.java)) {
            @Suppress("UNCHECKED_CAST")
            return ContactosViewModel(repository) as T
        }
        throw IllegalArgumentException("Unknown ViewModel class")
    }
}

data class NuevoContacto(
    val nombre : String = "",
    val apellido : String = "",
    val edad : Int? = null,
    val email : String = "",
    val fotoUri : String? = null
)