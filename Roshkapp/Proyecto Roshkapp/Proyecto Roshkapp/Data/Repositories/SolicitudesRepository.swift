//
//  SolicitudesRepository.swift
//  Proyecto Roshkapp
//
//  Created by Bootcamp on 2025-12-09.
//
import Foundation

protocol SolicitudesRepositoryProtocol {
    func getSolicitudes(token: String) async throws -> [SolicitudesResponseModel]
}

struct SolicitudesRepositoryImplementation : SolicitudesRepositoryProtocol {
    let appService : AppService
    func getSolicitudes(token: String) async throws -> [SolicitudesResponseModel] {
        print("getting solicitudes")
        return try await appService.execute(from: Endpoints.novedades.rawValue,
                                            method: .GET,
                                            type: [SolicitudesResponseModel].self,
                                            token: token)
    }
}

