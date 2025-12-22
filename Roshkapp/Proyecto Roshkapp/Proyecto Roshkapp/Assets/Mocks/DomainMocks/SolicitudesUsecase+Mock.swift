//
//  SolicitudesUsecase+Mock.swift
//  Proyecto Roshkapp
//
//  Created by Bootcamp on 2025-12-21.
//


extension SolicitudesUsecase {
    static func mock() -> SolicitudesUsecase {
        return SolicitudesUsecase(keychain: KeychainManager.shared, solicitudesRepository: SolicitudesRepositoryImplementation.mock())
    }
}
