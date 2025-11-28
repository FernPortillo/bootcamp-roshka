//
//  UCCEndpoint.swift
//  UIKitCrashCourse
//
//  Created by Bootcamp on 2025-11-28.
//

import Foundation

// frozen congela el enum, evitando que se pueda agregar lugares post uso
/// Representa los endpoints de la API
@frozen
public enum UCCEndpoint: String{
    /// Endpoint del character info
    case character
    /// Endpoint del location info
    case location
    /// Endpoint del episodio info
    case episode
}
