//
//  UserUsecase+Mock.swift
//  Proyecto Roshkapp
//
//  Created by Bootcamp on 2025-12-04.
//

extension UserUsecase {
    static func mock() -> UserUsecase {
        return UserUsecase(
            keychain: KeychainManager.shared,
            userRepository: UserRepositoryImplementation.mock(),
            appState: AppState.mockAuthenticated()
        )
    }
}
