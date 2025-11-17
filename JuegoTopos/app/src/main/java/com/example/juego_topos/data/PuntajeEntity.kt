package com.example.juego_topos.data

import androidx.room.Entity
import androidx.room.PrimaryKey

@Entity(tableName = "puntajes")
data class PuntajeEntity (
    @PrimaryKey val nombrePlayer : String = "",
    val puntaje : Int,
    )