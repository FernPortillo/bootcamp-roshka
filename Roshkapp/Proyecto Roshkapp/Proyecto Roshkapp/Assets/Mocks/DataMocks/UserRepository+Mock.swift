//
//  UserRepository+Mock.swift
//  Proyecto Roshkapp
//
//  Created by Bootcamp on 2025-12-04.
//

extension UserRepositoryImplementation {
    static func mock() -> UserRepositoryImplementation {
        return UserRepositoryImplementation(appService: AppService())
    }
}
