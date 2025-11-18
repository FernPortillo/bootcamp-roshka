package com.example.juego_topos.data


import androidx.room.Dao
import androidx.room.Delete
import androidx.room.Insert
import androidx.room.Query
import kotlinx.coroutines.flow.Flow

@Dao
interface PuntajeDAO {
    @Query("SELECT * FROM puntajes ORDER BY puntaje DESC LIMIT 5")
    fun getPuntajesMasAltos(): Flow<List<PuntajeEntity>>

    @Insert
    suspend fun insertPuntaje(puntaje: PuntajeEntity)

    @Delete
    suspend fun deletePuntaje(puntaje: PuntajeEntity)
}
