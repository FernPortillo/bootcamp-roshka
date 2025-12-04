//
//  UserUsecase.swift
//  Proyecto Roshkapp
//
//  Created by Bootcamp on 2025-12-04.
//

import Foundation

final class UserUsecase
{
    private let keychain : KeychainManager
    private let userRepository : UserRepositoryImplementation
    
    init(keychain: KeychainManager, userRepository: UserRepositoryImplementation) {
        self.keychain = keychain
        self.userRepository = userRepository
    }
    
    func getMyUser() async throws -> UserModel
    {
        let token = try? keychain.getAccessToken()
        guard !token!.isEmpty else {
            print("Token vacio? (no deberia llegar aca)")
            throw ApiError.unknownError
        }
        return try await userRepository.getMyUser(token: token!)
    }
    
        //TODO: Logout
}
