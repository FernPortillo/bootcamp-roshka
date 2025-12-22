//
//  NovedadesRepositoryProtocol.swift
//  Proyecto Roshkapp
//
//  Created by Bootcamp on 2025-12-18.
//


protocol NovedadesRepositoryProtocol {
    func getAvisos(token: String) async throws -> [NovedadesModel]
    func getCarrusel(token: String) async throws -> [NovedadesModel]
}
