//
//  MainMenuView.swift
//  Jueguitos
//
//  Created by Bootcamp on 2025-11-27.
//

import SwiftUI

struct MainMenuView: View {
    @EnvironmentObject var uiState : UIState
    
    var body: some View {
        TabView{
            PokerView()
                .tabItem{
                    Label("Poker", systemImage: "suit.club.fill")
                }
            GameView()
                .tabItem{
                    Label("Topo", systemImage: "gamecontroller.fill")
            }
        }
    }
}

#Preview {
    MainMenuView()
        .environmentObject(UIState())
}
