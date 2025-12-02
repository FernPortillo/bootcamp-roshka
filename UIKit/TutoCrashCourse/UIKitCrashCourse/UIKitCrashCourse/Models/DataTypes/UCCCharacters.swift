//
//  UCCCharacters.swift
//  UIKitCrashCourse
//
//  Created by Bootcamp on 2025-11-28.
//

import Foundation

/// Modelo de datos para asociar a la API call de los Characters
struct UCCCharacters: Codable, Sendable
{
    let id: Int
    let name: String
    let status: UCCCharacterStatus
    let species: String
    let type: String
    let gender: UCCCharacterGender
    let origin: UCCSingleLocation
    let location: UCCSingleLocation
    let image: String
    let episode: [String]
    let url: String
    let created: String
  }

