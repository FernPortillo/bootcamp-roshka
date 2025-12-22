//
//  UserUsecase.swift
//  Proyecto Roshkapp
//
//  Created by Bootcamp on 2025-12-04.
//

import Foundation
import SwiftUI

final class UserUsecase : AuthenticatedUsecase
{
    let keychain : KeychainManager
    let userRepository : UserRepositoryImplementation
    
    init(keychain: KeychainManager, userRepository: UserRepositoryImplementation) {
        self.keychain = keychain
        self.userRepository = userRepository
    }
    
    func getUser() async throws -> UserModel {
        let user = try await executeWithToken{ token in
            try await userRepository.getMyUser(token: token)
        }
        return user
    }
    
    func getUserById(idUser: Int) async throws -> UserModel {
        let user = try await executeWithToken{ token in
            try await userRepository.getUserById(token: token, idUser: idUser)
        }
        return user
    }
}
