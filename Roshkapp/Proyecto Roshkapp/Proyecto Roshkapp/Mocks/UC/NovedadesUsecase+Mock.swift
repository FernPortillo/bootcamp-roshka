//
//  NovedadesUsecase+Mock.swift
//  Proyecto Roshkapp
//
//  Created by Bootcamp on 2025-12-08.
//


extension NovedadesUsecase {
    static func mock() -> NovedadesUsecase {
        return NovedadesUsecase(
            keychain: KeychainManager.shared,
            novedadesRepository: NovedadesRepositoryImplementation.mock()
        )
    }
}
