//
//  NonAuthenticatedView.swift
//  Proyecto Roshkapp
//
//  Created by Bootcamp on 2025-12-20.
//


import SwiftUI
struct NonAuthenticatedView: View {
    @Environment(\.appColors) var colors
    @EnvironmentObject var appState: AppState
    @StateObject private var loginVM: LoginViewModel
        
        init(loginUC: LoginUsecase) {
            _loginVM = StateObject(wrappedValue: LoginViewModel(loginUseCase: loginUC))
//            for family in UIFont.familyNames.sorted() {
//                print("Family: \(family)")
//                for name in UIFont.fontNames(forFamilyName: family) {
//                    print("   \(name)")
//                }
//            }
        }
        
        var body: some View {
            LoginScreen(loginVM: loginVM)
                .background(colors.colorBackgroundLogin)
        }
}

#Preview {
    let a = AppState.mockNotAuthenticated()
    NonAuthenticatedView(loginUC: LoginUsecase.mock())
        .environmentObject(a)
        .withAppColors()
}
