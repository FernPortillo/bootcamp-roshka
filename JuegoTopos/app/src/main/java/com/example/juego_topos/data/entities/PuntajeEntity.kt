package com.example.juego_topos.data.entities

import androidx.room.Entity
import androidx.room.PrimaryKey

@Entity(tableName = "puntajes")
data class PuntajeEntity (
    @PrimaryKey(autoGenerate = true)
    val id : Int = 0,
    val nombrePlayer : String = "",
    val puntaje : Int,
    )