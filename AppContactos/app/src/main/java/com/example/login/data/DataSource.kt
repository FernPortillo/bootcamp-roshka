package com.example.login.data

import com.example.login.R
import com.example.login.model.Contacto

class DataSource {
    fun loadContactos() : List<Contacto> {
        return listOf(
            Contacto(R.string.nombre1,22,R.drawable.bart),
            Contacto(R.string.nombre2, 19, R.drawable.ney),
            Contacto(R.string.nombre3, 59, R.drawable.kir),
            Contacto(R.string.nombre4, 34, R.drawable.pika2),
            Contacto(R.string.nombre5, 29, R.drawable.darwin)
        )
    }
}