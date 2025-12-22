//
//  LoginResponse.swift
//  Proyecto Roshkapp
//
//  Created by Bootcamp on 2025-12-03.
//

import Foundation

struct LoginResponse: Codable, Sendable
{
    let message: String
    let correo: String
    let rol: Int
    let token: String
    
    
    enum CodingKeys: String, CodingKey {
        case message = "Message"
        case correo, rol, token
    }
}


// ejemplo token
// "eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ0aEB0aC5jb20iLCJyb2wiOjEsImV4cCI6MTc2NDc4ODk4MSwiaWF0IjoxNzY0NzgxNzgxfQ.ik6R9K4r7EK0YaAnutiCrfEZSosFoO6j-ntzv1ItBE0"
