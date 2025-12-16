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
    let appState : AppState
    let userRepository : UserRepositoryImplementation
    
    init(keychain: KeychainManager, userRepository: UserRepositoryImplementation, appState: AppState) {
        self.keychain = keychain
        self.userRepository = userRepository
        self.appState = appState
    }
    
    func getUser() async throws -> UserModel {
        let user = try await executeWithToken{ token in
            try await userRepository.getMyUser(token: token)
        }
        appState.myUser = user
        return user
    }
    
    func getUserById(idUser: Int) async throws -> UserModel {
        let user = try await executeWithToken{ token in
            try await userRepository.getUserById(token: token, idUser: idUser)
        }
        return user
    }
    
    func checkUserisMyUser(user: UserModel) -> Bool{
        return appState.checkMyUser(user: user)
    }
    
        //TODO: Logout
}
