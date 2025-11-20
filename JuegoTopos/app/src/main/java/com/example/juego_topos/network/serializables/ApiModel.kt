package com.example.juego_topos.network.serializables

import android.os.Parcelable
import com.google.gson.annotations.SerializedName
import kotlinx.parcelize.Parcelize

@Parcelize
data class ListaPokemonDataModel (
    val count: Int,
    val next: String?,
    val previous: String?,
    val results: List<PokemonListItem>
) : Parcelable

@Parcelize
data class PokemonListItem (
    @SerializedName("name") val name: String,
    @SerializedName("url") val url: String
) : Parcelable

@Parcelize
data class PokemonDetailDataModel (
    @SerializedName("name") val name: String,
    @SerializedName("height") val height: Long,
    @SerializedName("sprites") val sprites: Sprites,
    @SerializedName("types")val types: List<Type>,
    @SerializedName("weight") val weight: Long
) : Parcelable

@Parcelize
data class Type (
    @SerializedName("name") val name: String
) : Parcelable

@Parcelize
data class TypeItem(
    @SerializedName("slot") val slot : Int,
    @SerializedName("type") val type : Type
) : Parcelable

@Parcelize
data class Sprites (
    @SerializedName("front_default")
    val frontDefault: String,
) : Parcelable
