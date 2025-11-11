package com.example.login.repository

import androidx.annotation.WorkerThread
import com.example.login.data.ContactoDAO
import com.example.login.data.ContactoEntity
import kotlinx.coroutines.flow.Flow

class ContactosRepository(private val contactosDAO: ContactoDAO)
{
    val allContacts : Flow<List<ContactoEntity>> = contactosDAO.getListaContactosOrdenada()

    @Suppress("RedundantSupressModifier")
    @WorkerThread
    suspend fun insert(contacto : ContactoEntity)
    {
        contactosDAO.insert(contacto)
    }

    @WorkerThread
    suspend fun delete(contacto: ContactoEntity)
    {
        contactosDAO.deleteUser(contacto)
    }

}