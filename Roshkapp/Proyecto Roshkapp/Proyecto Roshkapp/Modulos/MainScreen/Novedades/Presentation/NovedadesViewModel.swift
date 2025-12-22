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
    @Published var carousel : [NovedadesModel]
    @Published var avisos : [NovedadesModel]
    @Published var isLoading : Bool = false
    @Published var errorMessage : String? = nil

    
    init(novedadesUsecase: NovedadesUsecase) {
        self.novedadesUC = novedadesUsecase
        self.carousel = []
        self.avisos = []
    }
    
    let novedadesUC : NovedadesUsecase
    
    // asignar carousel y novedades
    func loadNovedades() async {
        print("inicializado vm correctamente (novedades)")
        await executeAsync {
            try await self.novedadesUC.fetchAndSortNovedades()
        } onSuccess: { [weak self] novedades in
            self?.avisos = novedades.texto 
            self?.carousel = novedades.carrusel
        }
    }
}
