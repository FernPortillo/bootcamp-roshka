//
//  ErrorAlertView.swift
//  Proyecto Roshkapp
//
//  Created by Bootcamp on 2025-12-22.
//

import SwiftUI

struct ErrorAlertView: View {
    @EnvironmentObject var appState : AppState
    @State var isAlertShowing : Bool
    var body: some View {
        Color.clear
            .alert("Error", isPresented: $isAlertShowing){
                Button("OK"){
                    appState.isAuthenticated = false
                }
            } message: {
                Text("No se pudo ingresar a la App, intente de nuevo.")
            }
    }
}

#Preview {
    let a = AppState.mockAuthenticated()
    ErrorAlertView(isAlertShowing: true)
        .environmentObject(a)
}
