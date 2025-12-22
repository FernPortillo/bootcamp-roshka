//
//  AuthRepository+Mock.swift
//  Proyecto Roshkapp
//
//  Created by Bootcamp on 2025-12-04.
//

extension AuthRepositoryImplementation {
    static func mock() -> AuthRepositoryImplementation {
        return AuthRepositoryImplementation(appService: AppService())
    }
}


