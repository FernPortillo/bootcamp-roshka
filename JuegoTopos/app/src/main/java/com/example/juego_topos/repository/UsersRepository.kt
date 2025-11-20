package com.example.juego_topos.repository

import androidx.annotation.WorkerThread
import com.example.juego_topos.data.dao.UsersDAO
import com.example.juego_topos.data.entities.UsuarioEntity

class UsersRepository(private val usersDao: UsersDAO)
{
    suspend fun checkIfUserExiste(userReg : String) : Boolean
    {
        return usersDao.checkIfUserExists(userReg) > 0
    }

    suspend fun checkLogin(user : String, pass : String) : Boolean
    {
        return usersDao.checkLogin(user, pass) > 0
    }

    @Suppress("RedundantSupressModifier")
    @WorkerThread
    suspend fun registrar(user: UsuarioEntity)
    {
        if (checkIfUserExiste(user.nombreUser)) return
        usersDao.registrarUser(user)
    }


}