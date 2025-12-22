//
//  AuthRepository.swift
//  Proyecto Roshkapp
//
//  Created by Bootcamp on 2025-12-03.
//

import Foundation

struct AuthRepositoryImplementation : AuthRepositoryProtocol {
    let appService : AppService
    func login(request: LoginRequest) async throws -> LoginResponse {
        return try await appService.execute(from: Endpoints.login.rawValue,
                                            method: .POST,
                                            type: LoginResponse.self,
                                            body: request)
    }
    func logout() async throws {}
}
