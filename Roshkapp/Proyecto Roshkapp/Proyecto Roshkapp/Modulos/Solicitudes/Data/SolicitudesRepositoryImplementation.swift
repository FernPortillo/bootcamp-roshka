//
//  SolicitudesRepository.swift
//  Proyecto Roshkapp
//
//  Created by Bootcamp on 2025-12-09.
//
import Foundation


struct SolicitudesRepositoryImplementation : SolicitudesRepositoryProtocol {
    let appService : AppService
    func getMySolicitudes(token: String) async throws -> [SolicitudesResponseModel] {
        print("getting solicitudes")
        return try await appService.execute(from: Endpoints.misSolicitudes.rawValue,
                                            method: .GET,
                                            type: [SolicitudesResponseModel].self,
                                            token: token)
    }
    
    func getAllSolicitudes(token: String) async throws -> (beneficios: [SolicitudesResponseModel],
                                                            permisos: [SolicitudesResponseModel],
                                                            vacaciones: [SolicitudesResponseModel]) {
        
        var beneficios: [SolicitudesResponseModel] = []
        var vacaciones: [SolicitudesResponseModel] = []
        var permisos: [SolicitudesResponseModel] = []
        
        // Usamos un do-catch individual para que si uno falla (como beneficios), los demás sigan funcionando
        
        // 1. BENEFICIOS
        do {
            let response = try await appService.execute(
                from: Endpoints.thTodosBeneficios.rawValue,
                method: .GET,
                type: PagedContent<SolicitudesResponseModel>.self,
                token: token
            )
            beneficios = response.content
        } catch {
            print("❌ ERROR EN BENEFICIOS: \(error)")
            // Si es 404, asumimos lista vacía para que no rompa la app
        }
        
        // 2. VACACIONES
        do {
            let response = try await appService.execute(
                from: Endpoints.thTodosVacaciones.rawValue,
                method: .GET,
                type: PagedContent<SolicitudesResponseModel>.self,
                token: token
            )
            vacaciones = response.content
        } catch {
            print("❌ ERROR EN VACACIONES: \(error)")
        }
        
        // 3. PERMISOS
        do {
            let response = try await appService.execute(
                from: Endpoints.thTodosBeneficios.rawValue,
                method: .GET,
                type: PagedContent<SolicitudesResponseModel>.self,
                token: token
            )
            permisos = response.content
        } catch {
            print("❌ ERROR EN PERMISOS: \(error)")
        }
        
        // IMPORTANTE: El orden debe coincidir EXACTAMENTE con el protocolo
        return (beneficios: beneficios, permisos: permisos, vacaciones: vacaciones)
    }
   
}


