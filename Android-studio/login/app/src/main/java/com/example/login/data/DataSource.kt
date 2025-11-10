package com.example.login.data

import androidx.compose.runtime.mutableStateListOf
import androidx.compose.ui.res.stringResource
import com.example.login.R
import com.example.login.model.Contacto
import java.util.Collections

class DataSource {
    fun loadContactos() : MutableList<Contacto> {
        return mutableStateListOf(
            Contacto(R.string.nombre1,22,R.drawable.alpelo),
            Contacto(R.string.nombre2, 19, R.drawable.ney),
            Contacto(R.string.nombre3, 59, R.drawable.kir),
            Contacto(R.string.nombre4, 34, R.drawable.pika2),
            Contacto(R.string.nombre5, 30, R.drawable.darwin),
            Contacto(R.string.nombre6,21,R.drawable.default_icon),
            Contacto(R.string.nombre7, 11, R.drawable.default_icon),
            Contacto(R.string.nombre8, 54, R.drawable.default_icon),
            Contacto(R.string.nombre9, 35, R.drawable.default_icon),
            Contacto(R.string.nombre10, 59, R.drawable.default_icon),
            Contacto(R.string.nombre11, 44,R.drawable.default_icon)
        )
    }

}