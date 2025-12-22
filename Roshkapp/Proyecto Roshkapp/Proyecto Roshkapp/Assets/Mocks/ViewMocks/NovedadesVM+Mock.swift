//
//  NovedadesVM+Mock.swift
//  Proyecto Roshkapp
//
//  Created by Bootcamp on 2025-12-08.
//


import Foundation

extension NovedadesViewModel {
    static func mock() -> NovedadesViewModel {
        return NovedadesViewModel(
            novedadesUsecase: NovedadesUsecase.mock()
        )
    }
}

extension SolicitudesViewmodel {
    static func mock() -> SolicitudesViewmodel{
        return SolicitudesViewmodel(solicitudesUsecase: SolicitudesUsecase.mock())
    }
}
