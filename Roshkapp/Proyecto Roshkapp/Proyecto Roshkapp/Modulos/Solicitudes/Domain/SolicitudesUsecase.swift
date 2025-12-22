//
//  SolicitudesUsecase.swift
//  Proyecto Roshkapp
//
//  Created by Bootcamp on 2025-12-18.
//

import Foundation

final class SolicitudesUsecase : AuthenticatedUsecase{
    let keychain: KeychainManager
    private let solicitudesRepository : SolicitudesRepositoryImplementation
    var allSolicitudes: [SolicitudesResponseModel] = []
    var permisos: [SolicitudesResponseModel] = []
    var beneficios: [SolicitudesResponseModel] = []
    var vacaciones: [SolicitudesResponseModel] = []

    
    init(keychain: KeychainManager, solicitudesRepository: SolicitudesRepositoryImplementation) {
        print("inicializado uc correctamente (solicitudes)")
        self.keychain = keychain
        self.solicitudesRepository = solicitudesRepository
    }
    
    func getAndSortMySolicitudes() async throws -> (allSolicitudes: [SolicitudesResponseModel],
                                                    permisos: [SolicitudesResponseModel],
                                                    vacaciones: [SolicitudesResponseModel],
                                                    beneficios: [SolicitudesResponseModel])
    {
        allSolicitudes = try await fetchSolicitudes()
        permisos = try await fetchSolicitudes().filter { $0.tipoSolicitud == "PERMISO"}
        beneficios = try await fetchSolicitudes().filter { $0.tipoSolicitud == "BENEFICIO"}
        vacaciones = try await fetchSolicitudes().filter { $0.tipoSolicitud == "VACACIONES"}
        return (allSolicitudes, permisos, vacaciones, beneficios)
    }
    

    func fetchSolicitudes() async throws ->([SolicitudesResponseModel]){
        print("Funcion solicitud")
        return try await executeWithToken{ token in
            try await solicitudesRepository.getMySolicitudes(token: token)
        }
    }
    
    func getAndSortAllSolicitudes() async throws -> (allSolicitudes: [SolicitudesResponseModel],
                                                          permisos: [SolicitudesResponseModel],
                                                          vacaciones: [SolicitudesResponseModel],
                                                     beneficios: [SolicitudesResponseModel]) {
        print("Tratando de obtener todas las solicitudes (TH)")
        
        let result = try await fetchAllSolicitudes()
        
        beneficios = result.beneficios
        vacaciones = result.vacaciones
        permisos = result.permisos
        allSolicitudes = beneficios + vacaciones + permisos
        
        print("Se trajeron: \(allSolicitudes.count) solicitudes totales, de las cuales \(permisos.count) son permisos, \(beneficios.count) son beneficios, \(vacaciones.count) son vacaciones")
        
        return (allSolicitudes, permisos, vacaciones, beneficios)
        
    }
    
    
    func fetchAllSolicitudes() async throws -> (beneficios: [SolicitudesResponseModel],
                                                permisos: [SolicitudesResponseModel],
                                                vacaciones: [SolicitudesResponseModel]) {
       print("Funcion solicitud (todas las solicitudes)")
       return try await executeWithToken { token in
           try await solicitudesRepository.getAllSolicitudes(token: token)
       }
   }
    
}

