//
//  MainScreen.swift
//  Proyecto Roshkapp
//
//  Created by Bootcamp on 2025-12-05.
//

import SwiftUI

struct MainScreen: View {
    @State private var router = Router()
    @ObservedObject var userVM : UserViewModel
    @ObservedObject var novedadesVM: NovedadesViewModel
    @State private var selectedSolicitudType : BotonSolicitudesTabViewEnumTests?
    
    var body: some View{
        NavigationStack(path: $router.navigationPath){
            router.selectedTab.view(userVM: userVM, novedadesVM: novedadesVM)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .toolbar(.visible, for: .bottomBar)
        .toolbar {
            //MARK: TOOLBAR ;-;
        }
        
    }
}




#Preview {
    let userVM = UserViewModel.mockLoaded()
    let novedadesVM = NovedadesViewModel.mock()
    MainScreen(userVM: userVM, novedadesVM: novedadesVM)
}

@Observable
class Router {
    var selectedTab: TabViewEnum = .home
    var navigationPath = NavigationPath()
    
    func navigate(to destination: any Hashable) {
        navigationPath.append(destination)
    }
}

