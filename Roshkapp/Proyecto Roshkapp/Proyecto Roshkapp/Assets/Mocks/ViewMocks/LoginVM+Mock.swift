//
//  LoginViewModel+Mock.swift
//  Proyecto Roshkapp
//
//  Created by Bootcamp on 2025-12-04.
//

import Foundation

extension LoginViewModel {
    static func mock() -> LoginViewModel {
        return LoginViewModel(
            loginUseCase: LoginUsecase.mock(),
        )
    }
}

