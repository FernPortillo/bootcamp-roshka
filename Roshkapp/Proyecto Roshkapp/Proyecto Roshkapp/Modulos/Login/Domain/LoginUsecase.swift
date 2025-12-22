//
//  LoginUsecase.swift
//  Proyecto Roshkapp
//
//  Created by Bootcamp on 2025-12-03.
//

import Foundation
import LocalAuthentication
import SwiftUI

final class LoginUsecase {
    private let authRepository : AuthRepositoryImplementation
    private let userPrefs = UserPreferences.shared
    let keychain: KeychainManager

    
    init(keychain: KeychainManager, authRepository: AuthRepositoryImplementation) {
        self.keychain = keychain
        self.authRepository = authRepository
    }
    
    
    func executeLogin(request: LoginRequest) async throws -> LoginResponse
    {
        guard !request.correo.isEmpty else {
            throw LoginErrors.emptyEmail
        }
        
        guard !request.contrasena.isEmpty else {
            throw LoginErrors.emptyPassword
        }
        
        let response : LoginResponse = try await authRepository.login(request: request)
        
        // Porque el success es un string estoy llorando
        guard !response.message.contains("Authentication Success") else {
            throw LoginErrors.wrongCredentials
        }
                
        return response 
    }

    
    func saveRememberMe(email: String, pass: String, remember : Bool){
        if remember{
            userPrefs.savedEmail = email
            userPrefs.rememberMe = true
        }
        else {
            userPrefs.savedEmail = ""
            userPrefs.rememberMe = false
        }
    }
    
    func clearRememberMe(){
        userPrefs.savedEmail = ""
        userPrefs.rememberMe = false
    }

    
    func saveToken(token: String){
        try? keychain.saveAccessToken(token)
    }

    func clearToken(){
        keychain.removeToken()
    }
    
    func logout(mantenerRecuerdame: Bool){
        clearToken()
        if !mantenerRecuerdame {
            clearRememberMe()
        }
    }
}
    
    
enum BiometricError: LocalizedError {
    case notAvailable
    case credentialsNotFound
    case emptyCredentials
    case authenticationFailed
    case userCancelled
    
    var errorDescription: String? {
        switch self {
        case .notAvailable:
            return "Los biométricos no están disponibles en este dispositivo"
        case .credentialsNotFound:
            return "No se encontraron credenciales guardadas"
        case .emptyCredentials:
            return "Las credenciales no pueden estar vacías"
        case .authenticationFailed:
            return "La autenticación biométrica falló"
        case .userCancelled:
            return "Autenticación cancelada por el usuario"
        }
    }
    
}

