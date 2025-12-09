//
//  MainScreen.swift
//  Proyecto Roshkapp
//
//  Created by Bootcamp on 2025-12-05.
//

import SwiftUI

struct MainScreen: View {
    @StateObject var userVM : UserViewModel
    @StateObject var novedadesVM: NovedadesViewModel
    
    var body: some View {
        TabView {
            Tab("Home", systemImage: "house")
            {
                HomeScreen(userVM: userVM, novedadesVM: novedadesVM)
            }
            Tab("Ver más", systemImage: "ellipsis")
            {
                
            }
        }
    }
}




#Preview {
    let userVM = UserViewModel.mockLoaded()
    let novedadesVM = NovedadesViewModel.mock()
    MainScreen(userVM: userVM, novedadesVM: novedadesVM)
}
