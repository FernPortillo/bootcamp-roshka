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
    var novedades : [NovedadesModel] = []
    
    
    init(keychain: KeychainManager, novedadesRepository: NovedadesRepositoryImplementation) {
        self.keychain = keychain
        self.novedadesRepository = novedadesRepository
    }
    
    func getNovedades() async throws -> [NovedadesModel] {
            novedades = try await executeWithToken{ token in
                try await novedadesRepository.getNovedades(token: token)
            }
        return novedades
    }
    
    /// Trae y sortea las novedades, si el bool es true, fuerza el refresh
    func fetchAndSortNovedades(forceRefresh: Bool = false) async throws -> (carousel: [NovedadesModel], texto: [NovedadesModel]) {
        if novedades.isEmpty || forceRefresh {
            novedades = try await executeWithToken { token in
                try await novedadesRepository.getNovedades(token: token)
            }
        }
        
        let carousel = novedades.filter { $0.imagenUrl != nil }
        let texto = novedades.filter { $0.imagenUrl == nil }
        
        return (carousel, texto)
    }
}
