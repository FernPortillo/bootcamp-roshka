//
//  JueguitosApp.swift
//  Jueguitos
//
//  Created by Bootcamp on 2025-11-25.
//

import SwiftUI

@main
struct JueguitosApp: App {
    var body: some Scene {
        @StateObject var uiState = UIState()
        WindowGroup {
            MainMenuView()
                .environmentObject(uiState)
        }
    }
}
