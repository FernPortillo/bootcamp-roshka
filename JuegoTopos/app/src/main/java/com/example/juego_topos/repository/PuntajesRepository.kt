package com.example.juego_topos.repository

import androidx.annotation.WorkerThread
import com.example.juego_topos.data.dao.PuntajeDAO
import com.example.juego_topos.data.entities.PuntajeEntity
import kotlinx.coroutines.flow.Flow

class PuntajesRepository(private val puntajeDAO : PuntajeDAO)
{
    val puntajesAltos : Flow<List<PuntajeEntity>> = puntajeDAO.getPuntajesMasAltos()

    suspend fun getPuntajesFromPlayer(nombre: String) : Flow<List<PuntajeEntity>>
    {
        return puntajeDAO.getAllPuntajesFromPlayer(nombre)
    }

    suspend fun checkIfExiste(nombre: String, puntos: Int) : Int
    {
        return puntajeDAO.checkIfPuntajeExiste(nombre, puntos)
    }

    @Suppress("RedundantSupressModifier")
    @WorkerThread
    suspend fun insert(puntaje: PuntajeEntity)
    {
        puntajeDAO.insertPuntaje(puntaje)
    }

    @WorkerThread
    suspend fun delete(puntaje: PuntajeEntity)
    {
        puntajeDAO.deletePuntaje(puntaje)
    }
}