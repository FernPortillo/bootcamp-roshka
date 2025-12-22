//
//  Proyecto_RoshkappApp.swift
//  Proyecto Roshkapp
//
//  Created by Bootcamp on 2025-12-02.
//
import SwiftUI

@main
struct Proyecto_RoshkappApp: App {
    private let repositoryFactory = RepositoryFactory()
    
    var body: some Scene {
        WindowGroup {
            AppRootView(
                repositoryFactory: repositoryFactory
            )
            .environmentObject(AppState(loginUC: repositoryFactory.loginUsecase))
            .environmentObject(repositoryFactory.userPrefs)
            .withAppColors()
            
        }
    }
}

/// StateObject -> Singletons, usar cuando la vista crea el objeto
/// Environment Object -> Cuando se tiene que recibir el objeto
/// ObservedObject -> Para pasar el objeto como parametro
/// let -> Propiedades inmutables
