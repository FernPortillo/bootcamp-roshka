package com.example.juego_topos.repository

import androidx.annotation.WorkerThread
import com.example.juego_topos.data.PuntajeDAO
import com.example.juego_topos.data.PuntajeEntity
import kotlinx.coroutines.flow.Flow

class PuntajesRepository(private val puntajeDAO : PuntajeDAO)
{
    val puntajesAltos : Flow<List<PuntajeEntity>> = puntajeDAO.getPuntajesMasAltos()

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