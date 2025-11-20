package com.example.pokedex.model

// To parse the JSON, install kotlin's serialization plugin and do:
//
// val json       = Json { allowStructuredMapKeys = true }
// val pokemonAPI = json.parse(PokemonAPI.serializer(), jsonString)

import android.annotation.SuppressLint
import kotlinx.serialization.*
import kotlinx.serialization.json.*
import java.io.Serial


@SuppressLint("UnsafeOptInUsageError")
@Serializable
data class PokemonAPI (
    val count: Int,
    val next: String?,
    val previous: String?,
    val results: List<Result>
)

@SuppressLint("UnsafeOptInUsageError")
@Serializable
data class Result (
    val name: String,
    val url: String
)

@SuppressLint("UnsafeOptInUsageError")
@Serializable
data class PokemonData (
    val abilities: List<Ability>,
    val height: Long,
    val id: Long,
    @SerialName("past_types")
    val pastTypes: JsonArray,
    val species: Species,
    val sprites: Sprites,
    val types: List<Type>,
    val weight: Long
)


@SuppressLint("UnsafeOptInUsageError")
@Serializable
data class Ability (
    val ability: Species? = null,

    @SerialName("is_hidden")
    val isHidden: Boolean,
    val slot: Long
)

@SuppressLint("UnsafeOptInUsageError")
@Serializable
data class Type (
    val slot: Long,
    val type: Species
)


@SuppressLint("UnsafeOptInUsageError")
@Serializable
data class Sprites (
    @SerialName("back_default")
    val backDefault: String,
    @SerialName("front_default")
    val frontDefault: String,
)
@SuppressLint("UnsafeOptInUsageError")
@Serializable
data class Species (
    val name: String,
    val url: String
)
