package com.example.juego_topos.data.dao

import androidx.room.Dao
import androidx.room.Delete
import androidx.room.Insert
import androidx.room.OnConflictStrategy
import androidx.room.Query
import com.example.juego_topos.data.entities.PuntajeEntity
import kotlinx.coroutines.flow.Flow

@Dao
interface PuntajeDAO {
    @Query("SELECT * FROM puntajes ORDER BY puntaje DESC LIMIT 5")
    fun getPuntajesMasAltos(): Flow<List<PuntajeEntity>>

    @Query("SELECT * FROM puntajes WHERE nombrePlayer LIKE :nombre ORDER BY puntaje DESC")
    fun getAllPuntajesFromPlayer(nombre: String): Flow<List<PuntajeEntity>>

    @Insert(onConflict = OnConflictStrategy.IGNORE)
    suspend fun insertPuntaje(puntaje: PuntajeEntity)

    @Delete
    suspend fun deletePuntaje(puntaje: PuntajeEntity)

    @Query("SELECT COUNT(*) FROM puntajes WHERE nombrePlayer = :nombre AND puntaje = :puntos")
    suspend fun checkIfPuntajeExiste(nombre: String, puntos: Int) : Int
}