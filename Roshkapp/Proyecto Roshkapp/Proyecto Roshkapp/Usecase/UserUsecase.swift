//
//  UserUsecase.swift
//  Proyecto Roshkapp
//
//  Created by Bootcamp on 2025-12-04.
//

import Foundation

final class UserUsecase : AuthenticatedUsecase
{
    let keychain : KeychainManager
    let userRepository : UserRepositoryImplementation
    
    init(keychain: KeychainManager, userRepository: UserRepositoryImplementation) {
        self.keychain = keychain
        self.userRepository = userRepository
    }
    
    func getUser() async throws -> UserModel {
        return try await executeWithToken{ token in
            try await userRepository.getMyUser(token: token)
        }
    }
    
        //TODO: Logout
}
