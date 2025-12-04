//
//  MainScreen.swift
//  Proyecto Roshkapp
//
//  Created by Bootcamp on 2025-12-03.
//

import SwiftUI

struct HomeScreen: View {
    @StateObject var userVM : UserViewModel

    var body: some View {
        switch userVM.state {
        case .idle:
            Text("")
                .onAppear{
                    Task{
                        await userVM.getUser()
                    }
                }
        case .loading:
            ProgressView()
        case .loaded(let user):
            HomeMenuTopbar(nombre: user.nombre)
        case .failed(let error):
            Text(error.localizedDescription)
        }
    }
}

#Preview("Loading") {
    HomeScreen(userVM: UserViewModel.mockLoading())
}

#Preview("Loaded") {
    HomeScreen(userVM: UserViewModel.mockLoaded())
}

#Preview("Error") {
    HomeScreen(userVM: UserViewModel.mockError())
}
