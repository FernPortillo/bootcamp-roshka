//
//  UCCCharacterStatus.swift
//  UIKitCrashCourse
//
//  Created by Bootcamp on 2025-11-28.
//

import Foundation

/// Modelo de datos de los Status de los Characters puede ser Alive, Dead, o Unknown
enum UCCCharacterStatus : String, Codable, Sendable {
    case alive = "Alive"
    case dead = "Dead"
    case `unknown` = "unknown"
}
