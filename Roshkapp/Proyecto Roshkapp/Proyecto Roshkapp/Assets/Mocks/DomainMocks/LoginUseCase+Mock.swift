//
//  LoginUsecase+Mock.swift
//  Proyecto Roshkapp
//
//  Created by Bootcamp on 2025-12-04.
//

import Foundation

extension LoginUsecase {
    static func mock() -> LoginUsecase {
        return LoginUsecase(
            keychain: KeychainManager.shared,
            authRepository: AuthRepositoryImplementation.mock()
        )
    }
}

