//
//  UCCEpisode.swift
//  UIKitCrashCourse
//
//  Created by Bootcamp on 2025-11-28.
//

import Foundation

/// Modelo de Datos del Episodio para la API call
struct UCCEpisode : Codable, Sendable
{
    let id: Int
    let name: String
    let air_date: Date
    let episode: String
    let characters: [String]
    let url: String
    let created: String
}
