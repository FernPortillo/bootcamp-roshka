//
//  AuthRepository.swift
//  Proyecto Roshkapp
//
//  Created by Bootcamp on 2025-12-03.
//

import Foundation


/// Protocol es la clase contrato
protocol AuthRepositoryProtocol {
    func login(request: LoginRequest) async throws -> LoginResponse
    func logout() async throws
}

struct AuthRepositoryImplementation : AuthRepositoryProtocol {
    let appService : AppService
    func login(request: LoginRequest) async throws -> LoginResponse {
        return try await appService.execute( type: LoginResponse.self, body: request)
    }
    func logout() async throws {}
}
