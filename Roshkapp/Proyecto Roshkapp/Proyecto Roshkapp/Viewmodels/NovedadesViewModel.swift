//
//  NovedadesViewModel.swift
//  Proyecto Roshkapp
//
//  Created by Bootcamp on 2025-12-05.
//

import Foundation
import Combine

final class NovedadesViewModel: BaseAuthenticatedViewModel
{
    @Published var carousel : [NovedadesModel?]
    @Published var novedades : [NovedadesModel?]
    @Published var isLoading : Bool = false
    @Published var errorMessage : String? = nil
    
    init(novedadesUsecase: NovedadesUsecase) {
        self.novedadesUC = novedadesUsecase
        self.carousel = []
        self.novedades = []
    }
    
    let novedadesUC : NovedadesUsecase
    
    // asignar carousel y novedades
    func loadNovedades() async {
        await executeAsync {
            try await self.novedadesUC.fetchAndSortNovedades(forceRefresh: false)
        } onSuccess: { [weak self] novedades in
            self?.novedades = novedades.texto
            self?.carousel = novedades.carousel
        }
    }
    
    
    func forceRefreshNovedades() async {
        await executeAsync {
            try await self.novedadesUC.fetchAndSortNovedades(forceRefresh: true)
        } onSuccess: { [weak self] novedades in
            self?.novedades = novedades.texto
            self?.carousel = novedades.carousel
        }
    }
}
