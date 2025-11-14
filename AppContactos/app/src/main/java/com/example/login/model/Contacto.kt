package com.example.login.model

import androidx.annotation.DrawableRes
import androidx.annotation.StringRes

data class Contacto(
    @StringRes val nombreContactoStringResId : Int,
    val edadContacto : Int,
    @DrawableRes val imagenContactoDrawableRes: Int
)