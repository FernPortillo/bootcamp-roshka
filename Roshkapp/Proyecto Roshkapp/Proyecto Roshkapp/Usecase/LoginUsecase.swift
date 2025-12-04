//
//  LoginUsecase.swift
//  Proyecto Roshkapp
//
//  Created by Bootcamp on 2025-12-03.
//

import Foundation

final class LoginUsecase {
    private let keychain: KeychainManager
    private let authRepository : AuthRepositoryImplementation
    
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
        
        // Guardar el token para una mauskerramienta mas adelante
        do {
            try? keychain.saveAccessToken(response.token)
        }
        
        return response //Cambiar tipo para evitar datos innecesarios?
    }
}

