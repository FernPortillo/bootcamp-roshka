//
//  LoginErrors.swift
//  Proyecto Roshkapp
//
//  Created by Bootcamp on 2025-12-03.
//

import Foundation


enum LoginErrors : LocalizedError {
    case emptyEmail
    case emptyPassword
    case wrongCredentials
    
    var errorDescription: String?{
        switch self {
        case .emptyEmail:
            return "Correo vacio"
        case .emptyPassword:
            return "Password vacia"
        case .wrongCredentials:
            return "Usuario o Pass incorrecta"
        }
    }
}
