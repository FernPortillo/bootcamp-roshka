//
//  SolicitudesViewmodel.swift
//  Proyecto Roshkapp
//
//  Created by Bootcamp on 2025-12-18.
//

import Foundation
import Combine

final class SolicitudesViewmodel: BaseAuthenticatedViewModel
{
    @Published var solicitudes : [SolicitudesResponseModel]
    @Published var beneficios : [SolicitudesResponseModel]
    @Published var vacaciones : [SolicitudesResponseModel]
    @Published var permisos : [SolicitudesResponseModel]
    @Published var isLoading : Bool = false
    @Published var errorMessage : String? = nil
    let solicitudesUsecase : SolicitudesUsecase
    
    init(solicitudesUsecase: SolicitudesUsecase) {
        print("inicializado vm correctamente (solicitudes)")
        self.solicitudes = []
        print("Solicitudes esta vacia")
        self.beneficios = []
        self.vacaciones = []
        self.permisos = []
        self.solicitudesUsecase = solicitudesUsecase
    }
    
    //
    func loadSolicitudes(isTH: Bool) async {
        if isTH {
            print("Es TH")
            await executeAsync {
                try await self.solicitudesUsecase.getAndSortAllSolicitudes()
            } onSuccess: { [weak self] solicitudes in
                self?.solicitudes = solicitudes.allSolicitudes
                self?.beneficios = solicitudes.beneficios
                self?.vacaciones = solicitudes.vacaciones
                self?.permisos = solicitudes.permisos
            }
        } else {
            print("No es th")
            await executeAsync {
                try await self.solicitudesUsecase.getAndSortMySolicitudes()
            } onSuccess: { [weak self] solicitudes in
                self?.solicitudes = solicitudes.allSolicitudes
                self?.beneficios = solicitudes.beneficios
                self?.vacaciones = solicitudes.vacaciones
                self?.permisos = solicitudes.permisos
            }
        }
    }
}
