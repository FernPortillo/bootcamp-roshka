//
//  LoginRequest.swift
//  Proyecto Roshkapp
//
//  Created by Bootcamp on 2025-12-03.
//

import Foundation

struct LoginRequest: Codable, Sendable
{
    let correo: String
    let contrasena: String
}
