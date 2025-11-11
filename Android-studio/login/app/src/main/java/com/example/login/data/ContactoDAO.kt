package com.example.login.data

import androidx.room.Dao
import androidx.room.Delete
import androidx.room.Insert
import androidx.room.OnConflictStrategy
import androidx.room.Query
import androidx.room.Update
import kotlinx.coroutines.flow.Flow

@Dao
interface ContactoDAO
{
    @Query("SELECT * FROM contactos ORDER BY nombre ASC")
    fun getListaContactosOrdenada(): Flow<List<ContactoEntity>>

    // Se usa suspend para llamar a la corutina y decir que no se haga en el main thread
    // sino de fondo, para que no se tranque la app
    @Insert(onConflict = OnConflictStrategy.ABORT)
    suspend fun insert(vararg contacto : ContactoEntity)

    @Update
    suspend fun updateUser(vararg contacto : ContactoEntity)

    @Delete
    suspend fun deleteUser(vararg contacto: ContactoEntity)
}