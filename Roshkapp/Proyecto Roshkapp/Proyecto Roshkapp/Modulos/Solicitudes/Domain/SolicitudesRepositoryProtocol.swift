//
//  SolicitudesRepositoryProtocol.swift
//  Proyecto Roshkapp
//
//  Created by Bootcamp on 2025-12-20.
//


protocol SolicitudesRepositoryProtocol {
    func getMySolicitudes(token: String) async throws -> [SolicitudesResponseModel]
    func getAllSolicitudes(token: String) async throws -> (beneficios: [SolicitudesResponseModel], permisos: [SolicitudesResponseModel], vacaciones: [SolicitudesResponseModel])
}
