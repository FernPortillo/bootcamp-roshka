//
//  TabViewEnum.swift
//  Proyecto Roshkapp
//
//  Created by Bootcamp on 2025-12-10.
//

import SwiftUI


enum TabViewEnum: String, Identifiable, CaseIterable {
    case home, verMas
    
    var id: Self { self }
    
    var tabItem: TabItem {
        switch self {
        case .home:
            .init(name: "Home", systemImage: "house")
        case .verMas:
            .init(name: "Ver Mas", systemImage: "ellipsis")

        }
    }
}

extension TabViewEnum {
    @ViewBuilder
    func view(userVM: UserViewModel, novedadesVM: NovedadesViewModel) -> some View {
        switch self {
            case .home:
                HomeScreen(userVM: userVM, novedadesVM: novedadesVM)
            case .verMas:
                Text("Ver Mas")
        }
    }
}

enum BotonSolicitudesTabViewEnumTests: Identifiable, CaseIterable, View {
    case vacaciones, beneficios, permisos, dispositivos
    var id: Self { self }
    
    var tabItem: TabItem {
        switch self {
        case .vacaciones:
                .init(name: "Vacaciones", systemImage: "beach.umbrella.fill")
        case .beneficios:
                .init(name: "Beneficios", systemImage: "gift")
        case .permisos:
                .init(name: "Permisos", systemImage: "calendar.badge.exclamationmark")
        case .dispositivos:
                .init(name: "Dispositivos", systemImage: "laptopcomputer")
        }
    }
    var body: some View {
        switch self {
            case .vacaciones:
                Text("Home")
            case .beneficios:
                Text("Home")
            case .dispositivos:
                Text("Home")
            case .permisos:
                Text("Home")

        }
    }
}

