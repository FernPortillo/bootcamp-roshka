package com.example.juego_topos.data.dao

import androidx.room.Dao
import androidx.room.Insert
import androidx.room.OnConflictStrategy
import androidx.room.Query
import com.example.juego_topos.data.entities.UsuarioEntity

@Dao
interface UsersDAO {
    @Insert(onConflict = OnConflictStrategy.Companion.IGNORE)
    suspend fun registrarUser(user : UsuarioEntity)

    @Query("SELECT COUNT(*) FROM usuarios WHERE nombreUser = :userLog AND password = :passLog")
    suspend fun checkLogin(userLog : String, passLog : String): Int

    @Query("SELECT COUNT(*) FROM usuarios WHERE nombreUser = :userReg")
    suspend fun checkIfUserExists(userReg : String): Int


}