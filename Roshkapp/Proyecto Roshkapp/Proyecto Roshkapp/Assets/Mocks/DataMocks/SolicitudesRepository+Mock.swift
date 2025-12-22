//
//  SolicitudesRepository+Mock.swift
//  Proyecto Roshkapp
//
//  Created by Bootcamp on 2025-12-21.
//


extension SolicitudesRepositoryImplementation {
    static func mock() -> SolicitudesRepositoryImplementation {
        return SolicitudesRepositoryImplementation( appService: AppService())
    }
}