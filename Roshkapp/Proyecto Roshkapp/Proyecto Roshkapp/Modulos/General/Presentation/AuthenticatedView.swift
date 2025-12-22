//
//  AuthenticatedView.swift
//  Proyecto Roshkapp
//
//  Created by Bootcamp on 2025-12-20.
//
import SwiftUI

struct AuthenticatedView: View {
    @EnvironmentObject var appState: AppState
    
    @StateObject private var userVM: UserViewModel
    @StateObject private var novedadesVM: NovedadesViewModel
    @StateObject private var photosVM: ProfilePicViewModel
    @StateObject private var solicitudesVM: SolicitudesViewmodel
    
    init(repositoryFactory: RepositoryFactory) {
        let userUC = UserUsecase(
            keychain: repositoryFactory.keychainManager,
            userRepository: repositoryFactory.userRepository
        )
        _userVM = StateObject(wrappedValue: UserViewModel(userUC: userUC))
        
        let novedadesUC = NovedadesUsecase(
            keychain: repositoryFactory.keychainManager,
            novedadesRepository: repositoryFactory.novedadesRepository
        )
        _novedadesVM = StateObject(wrappedValue: NovedadesViewModel(novedadesUsecase: novedadesUC))
        
        let photosUC = ProfilePicUseCase(
            keychain: repositoryFactory.keychainManager,
            newProfilePictureRepository: repositoryFactory.photosRepository
        )
        _photosVM = StateObject(wrappedValue: ProfilePicViewModel(profilePicUsecase: photosUC))
        
        let solicitudesUC = SolicitudesUsecase(
            keychain: repositoryFactory.keychainManager,
            solicitudesRepository: repositoryFactory.solicitudesRepository
        )
        _solicitudesVM = StateObject(wrappedValue: SolicitudesViewmodel(solicitudesUsecase: solicitudesUC))
    }
    
    var body: some View {
        NavigationContainer {
            MainScreen()
        }
        .environmentObject(userVM)
        .environmentObject(novedadesVM)
        .environmentObject(photosVM)
        .environmentObject(solicitudesVM)
    }
}


