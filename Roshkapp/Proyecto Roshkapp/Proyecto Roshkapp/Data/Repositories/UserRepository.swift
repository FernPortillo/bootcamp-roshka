//
//  UserRepository.swift
//  Proyecto Roshkapp
//
//  Created by Bootcamp on 2025-12-04.
//

import Foundation


protocol UserRepositoryProtocol {
    func getMyUser(token: String) async throws -> UserModel
}

struct UserRepositoryImplementation : UserRepositoryProtocol {
    let appService : AppService
    func getMyUser(token: String) async throws -> UserModel {
        // print("getting user")
        return try await appService.execute(from: Endpoints.myUser.rawValue,
                                            method: .GET,
                                            type: UserModel.self,
                                            token: token)
    }
}
