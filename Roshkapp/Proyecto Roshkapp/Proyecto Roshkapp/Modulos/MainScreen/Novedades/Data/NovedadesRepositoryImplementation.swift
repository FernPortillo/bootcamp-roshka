//
//  NovedadesRepository.swift
//  Proyecto Roshkapp
//
//  Created by Bootcamp on 2025-12-05.
//

import Foundation


struct NovedadesRepositoryImplementation : NovedadesRepositoryProtocol {
    let appService : AppService
    
    
    func getCarrusel(token: String) async throws -> [NovedadesModel] {
        print("Getting carousel")
        let carrusel = try await appService.execute(from: Endpoints.carrusel.rawValue,
                                            method: .GET,
                                            type: [NovedadesModel].self,
                                            token: token)
        return carrusel
    }
    
    
    func getAvisos(token: String) async throws -> [NovedadesModel] {
        print("Getting avisos")
        let avisos = try await appService.execute(from: Endpoints.avisos.rawValue,
                                            method: .GET,
                                            type: [NovedadesModel].self,
                                            token: token)
        return avisos
    }
    
}

