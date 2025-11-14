package com.example.cuadriculavertical.model

import androidx.annotation.DrawableRes
import androidx.annotation.StringRes

data class Topic(
    @StringRes val topicNameId : Int,
    val people : Int,
    @DrawableRes val topicPicId : Int
)
