//
//  MainScreen.swift
//  Proyecto Roshkapp
//
//  Created by Bootcamp on 2025-12-03.
//

import SwiftUI

struct HomeScreen: View {
    @Environment(\.appColors) var colors
    @EnvironmentObject var userVM : UserViewModel
    @EnvironmentObject var novedadesVM : NovedadesViewModel
    @EnvironmentObject var appState: AppState
    @State var isShowingHamburgerMenu = false
    @State var isAlertErrorPresented = false
    @State var viewIndex = "Home"
    
    
    var body: some View {
        let permisosTH = appState.checkPermisosTH()
        let screenWidth = UIScreen.main.bounds.width
        let menuWidth = screenWidth * 0.7
        let _ = print("uservm state: \(userVM.state)")

        ZStack{
            colors.appBackgroundColor
                .ignoresSafeArea()
            
            VStack(alignment: .leading){
                let _ = print("evaluando state")

                switch userVM.state {
                case .idle:
                    let _ = print("es idle")
                    Color.clear
                        .onAppear{
                            Task{
                                await userVM.getUser()
                                await novedadesVM.loadNovedades()
                            }
                        }
                case .loading:
                    let _ = print("es loading")
                    VStack {
                        ProgressView()
                            .controlSize(.large)
                            .padding()
                        Text("Cargando novedades...")
                            .font(.regularBody)
                            .foregroundColor(.secondary)
                    }
                    .padding()
                case .loaded(let user):
                    ZStack{
                        ScrollView{
                            HomeMenuTopbar(isShowing: $isShowingHamburgerMenu)
                                .padding(.vertical, Spacing.s)
                            if novedadesVM.isLoading{
                                VStack {
                                    ProgressView()
                                        .controlSize(.large)
                                        .padding()
                                    Text("Cargando novedades...")
                                        .font(.regularBody)
                                        .foregroundColor(.secondary)
                                }
                                .padding()
                            }
                            else {
                                InfiniteCarouselView(novedades: novedadesVM.carousel, permisosTH: permisosTH) // pasar novedades: novedadesVM.carousel
                                    .padding(.bottom, Spacing.mm)
                                
                                let ordenadasText: [NovedadesModel] = novedadesVM.avisos
                                
                                if !ordenadasText.isEmpty{
                                    NovedadesManager(novedades: ordenadasText)
                                }
                                else
                                {
                                    EmptySectionComponent(mensaje: "No hay novedades a mostrar", icon: IconsEnum.sadface.rawValue)
                                }
                            }
                        }
                        if isShowingHamburgerMenu {
                            Color.black.opacity(0.3)
                                .ignoresSafeArea()
                                .onTapGesture {
                                    withAnimation(.easeInOut(duration: 0.3)) {
                                        isShowingHamburgerMenu = false
                                    }
                                }
                        }
                        HamburgerMenu(viewIndex: $viewIndex, isShowing: $isShowingHamburgerMenu, permisosTH: permisosTH)
                            .frame(width: menuWidth, alignment: .leading)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .offset(x: isShowingHamburgerMenu ? 0 : -menuWidth)
                            .animation(nil, value: isShowingHamburgerMenu)
                    }
                    .onAppear{
                        appState.myUser = user
                        print("Loaded")
                    }
                    .onChange(of: user.idUsuario)
                    {
                        appState.myUser = user
                    }
                    
                case .failed(let error):
                    LoginRecordado(loginVM: LoginViewModel.mock())
                        .onAppear{
                        Task{
                            isAlertErrorPresented = true
                            print(error)
                        }
                    }
                }
            }
        }
        .alert("Error", isPresented: $isAlertErrorPresented) {
                Button("OK") {
                    appState.isAuthenticated = false
                }
        } message: {
            Text("No se pudo ingresar a la aplicación, intente de nuevo")
        }
    }
}

#Preview {
    let r = Router()
    let photosVM = ProfilePicViewModel.mock()
    let s = SolicitudesViewmodel.mock()
    let userVM = UserViewModel.mockLoaded()
    let a = AppState.mockAuthenticated()
    let novedadesVM = NovedadesViewModel.mock()
    HomeScreen()
        .environmentObject(photosVM)
        .environmentObject(a)
        .environmentObject(userVM)
        .environmentObject(novedadesVM)
        .environmentObject(s)
        .environment(r)
        .withAppColors()
}

