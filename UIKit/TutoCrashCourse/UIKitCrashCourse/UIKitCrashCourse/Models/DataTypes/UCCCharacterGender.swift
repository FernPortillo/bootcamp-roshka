//
//  UCCCharacterGender.swift
//  UIKitCrashCourse
//
//  Created by Bootcamp on 2025-11-28.
//

import Foundation

/// Modelo de datos del Character Gender, puede ser Female, Male, Genderless, Unknown
enum UCCCharacterGender : String, Codable {
    case female = "Female"
    case male = "Male"
    case genderless = "Genderless"
    case `unknown` = "unknown"
}
