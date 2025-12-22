//
//  AppColorsModifier.swift
//  Proyecto Roshkapp
//
//  Created by Bootcamp on 2025-12-20.
//

import Foundation
import SwiftUI

/// Verifica si es dark o light
struct AppColorsModifier: ViewModifier {
    @Environment(\.colorScheme) var colorScheme
    
    private var appColors: AppColorsProtocol {
        colorScheme == .dark ? DarkColors() : LightColors()
    }
    
    func body(content: Content) -> some View {
        content
            .environment(\.appColors, appColors)
    }
}

/// Modifica la view para poder usarla en el appview
extension View {
    func withAppColors() -> some View {
        modifier(AppColorsModifier())
    }
}

/// Default va a ser light
struct AppColorsKey: EnvironmentKey {
    static let defaultValue: AppColorsProtocol = LightColors()
}

/// Environment key
extension EnvironmentValues {
    var appColors: AppColorsProtocol {
        get { self[AppColorsKey.self] }
        set { self[AppColorsKey.self] = newValue }
    }
}
