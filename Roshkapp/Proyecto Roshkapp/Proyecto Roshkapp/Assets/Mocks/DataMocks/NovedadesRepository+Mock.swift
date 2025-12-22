//
//  NovedadesRepository+Mock.swift
//  Proyecto Roshkapp
//
//  Created by Bootcamp on 2025-12-08.
//


extension NovedadesRepositoryImplementation {
    static func mock() -> NovedadesRepositoryImplementation {
        return NovedadesRepositoryImplementation(appService: AppService())
    }
}
