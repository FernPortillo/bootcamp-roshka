//
//  NovedadesRepository.swift
//  Proyecto Roshkapp
//
//  Created by Bootcamp on 2025-12-05.
//

import Foundation

protocol NovedadesRepositoryProtocol {
    func getNovedades(token: String) async throws -> [NovedadesModel]
}

struct NovedadesRepositoryImplementation : NovedadesRepositoryProtocol {
    let appService : AppService
    func getNovedades(token: String) async throws -> [NovedadesModel] {
        // print("getting user")
        return try await appService.execute(from: Endpoints.novedades.rawValue,
                                            method: .GET,
                                            type: [NovedadesModel].self,
                                            token: token)
    }
}

