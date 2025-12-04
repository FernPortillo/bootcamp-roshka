//
//  LoginUsecase.swift
//  Proyecto Roshkapp
//
//  Created by Bootcamp on 2025-12-03.
//

import Foundation

final class LoginUsecase {
    private let authRepository : AuthRepositoryImplementation
    
    init(authRepository: AuthRepositoryImplementation) {
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
        
        var response : LoginResponse = try await authRepository.login(request: request)

        // Porque el success es un string estoy llorando
        guard !response.message.contains("Authentication Success") else {
            throw LoginErrors.wrongCredentials
        }
        
        return response //Cambiar tipo para evitar datos innecesarios?
    }
}

