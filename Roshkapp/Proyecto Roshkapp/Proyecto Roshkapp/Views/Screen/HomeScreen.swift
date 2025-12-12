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
        VStack(alignment: .leading){
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
                ScrollView{
                    HomeMenuTopbar(user: user)
                        .padding(.vertical, Spacing.s)
                    InfiniteCarouselView()
                        .padding(.bottom, Spacing.mm)
                    
                    //MARK: cambiar para probar con novedades real
                    // Para testeo
                    let mock = NovedadesModel.mockNovedadText.sorted { $0.prioridad && !$1.prioridad}
//                    let ordenadas = novedadesVM.novedades.sorted { $0.prioridad & $1.prioridad}
                    
                    
                    
                    if !mock.isEmpty{
                        NovedadesManager(novedades: mock)
                    }
                    else
                    {
                        EmptySectionComponent(mensaje: "No hay novedades a mostrar", icon: IconsEnum.sadface.rawValue)
                    }
                }
                .padding(Spacing.s)
            case .failed(let error):
                Text(error.localizedDescription)
            }
        }
        .background(Color.appBackgroundColor)
    }
}

#Preview {
    @Previewable let photosVM = ProfilePicViewModel.mock()
    let userVM = UserViewModel.mockLoaded()
    let novedadesVM = NovedadesViewModel.mock()
    HomeScreen(userVM: userVM, novedadesVM: novedadesVM)
        .environmentObject(photosVM)
}

