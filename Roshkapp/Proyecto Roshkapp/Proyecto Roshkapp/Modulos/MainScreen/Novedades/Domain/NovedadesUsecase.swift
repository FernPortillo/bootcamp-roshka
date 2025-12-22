//
//  NovedadesUsecase.swift
//  Proyecto Roshkapp
//
//  Created by Bootcamp on 2025-12-05.
//

import Foundation


final class NovedadesUsecase : AuthenticatedUsecase {
    let keychain: KeychainManager
    private let novedadesRepository : NovedadesRepositoryImplementation
    var carrusel: [NovedadesModel] = []
    var texto: [NovedadesModel] = []
    
    init(keychain: KeychainManager, novedadesRepository: NovedadesRepositoryImplementation) {
        self.keychain = keychain
        self.novedadesRepository = novedadesRepository
    }
    
    /// Trae y sortea las novedades, 
    func fetchAndSortNovedades() async throws -> (carrusel: [NovedadesModel], texto: [NovedadesModel]) {
        carrusel = try await fetchCarrusel().sorted { $0.prioridad && !$1.prioridad}
        texto = try await fetchAvisos().sorted { $0.prioridad && !$1.prioridad}
        
        return (carrusel, texto)
    }
    
    func fetchAvisos() async throws ->([NovedadesModel]){
        return try await executeWithToken{ token in
            try await novedadesRepository.getAvisos(token: token)
        }
    }
    
    func fetchCarrusel() async throws ->([NovedadesModel]){
        return try await executeWithToken{ token in
            try await novedadesRepository.getCarrusel(token: token)
        }
    }
}

