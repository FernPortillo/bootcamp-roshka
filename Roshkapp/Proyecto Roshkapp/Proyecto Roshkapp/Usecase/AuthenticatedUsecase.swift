//
//  AuthenticatedUsecase.swift
//  Proyecto Roshkapp
//
//  Created by Bootcamp on 2025-12-05.
//

import Foundation

protocol AuthenticatedUsecase {
    var keychain : KeychainManager { get }
}

extension AuthenticatedUsecase{
    func executeWithToken<T>(_ operation: (String) async throws -> T) async throws -> T
    {
        guard let token = try? keychain.getAccessToken(), !token.isEmpty else {
            print("Token vacio? (no deberia llegar aca)")
            throw ApiError.unknownError
        }
        return try await operation(token)
    }
}
