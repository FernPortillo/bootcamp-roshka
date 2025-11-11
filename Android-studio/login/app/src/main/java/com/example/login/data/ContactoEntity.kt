package com.example.login.data

import android.graphics.Bitmap
import androidx.room.Entity
import androidx.room.Ignore
import androidx.room.PrimaryKey

@Entity(tableName = "contactos")
data class ContactoEntity(
    @PrimaryKey(autoGenerate = true) val idContacto : Int = 0,
    val nombre : String,
    val apellido : String,
    val edad : Int,
    val email : String,
    val fotoUri : String?
    )