//
//  UCCLocation.swift
//  UIKitCrashCourse
//
//  Created by Bootcamp on 2025-11-28.
//

import Foundation

/// Modelo de datos de la Location para la API Call
struct UCCLocation : Codable
{
    let id: Int
    let name: String
    let type: String
    let dimension: String
    let residents: [String]
    let url: String
    let created: String
}

/// Modelo de datos de una Location unica, util para datos simples de location
struct UCCSingleLocation : Codable
{
    let name: String
    let url: String
}
