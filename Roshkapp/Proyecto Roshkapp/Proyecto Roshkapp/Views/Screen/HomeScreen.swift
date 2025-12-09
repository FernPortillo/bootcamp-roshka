//
//  MainScreen.swift
//  Proyecto Roshkapp
//
//  Created by Bootcamp on 2025-12-03.
//

import SwiftUI

struct HomeScreen: View {
    @ObservedObject var userVM : UserViewModel
    @ObservedObject var novedadesVM : NovedadesViewModel
    
    
    var body: some View {
        switch userVM.state {
        case .idle:
            Text("")
                .onAppear{
                    Task{
                        await userVM.getUser()
                        await novedadesVM.loadNovedades()
                    }
                }
        case .loading:
            ProgressView()
        case .loaded(let user):
            HomeMenuTopbar(nombre: user.nombre)
            InfiniteCarouselView()
            NovedadesText()
        case .failed(let error):
            Text(error.localizedDescription)
        }
    }
}

#Preview {
    let userVM = UserViewModel.mockLoaded()
    let novedadesVM = NovedadesViewModel.mock()
    HomeScreen(userVM: userVM, novedadesVM: novedadesVM)
}

