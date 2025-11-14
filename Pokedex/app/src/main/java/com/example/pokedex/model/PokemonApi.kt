package com.example.pokedex.model

// To parse the JSON, install kotlin's serialization plugin and do:
//
// val json       = Json { allowStructuredMapKeys = true }
// val pokemonAPI = json.parse(PokemonAPI.serializer(), jsonString)

import kotlinx.serialization.*
import kotlinx.serialization.json.*


@Serializable
data class PokemonAPI (
    val count: Int,
    val next: String?,
    val previous: String?,
    val results: List<Result>
)

@Serializable
data class Result (
    val name: String,
    val url: String
)
