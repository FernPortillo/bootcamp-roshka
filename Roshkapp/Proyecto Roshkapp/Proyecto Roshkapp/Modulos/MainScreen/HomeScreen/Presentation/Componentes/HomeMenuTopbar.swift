//
//  HomeMenuTopbar.swift
//  Proyecto Roshkapp
//
//  Created by Bootcamp on 2025-12-04.
//

import SwiftUI

struct HomeMenuTopbar: View {
    @Environment(\.appColors) var colors
    @Environment(Router.self) var router: Router
    @Binding var isShowing : Bool
    var body: some View {
        HStack(alignment: .center){
            Image("menu.icon")
                .resizable()
                .frame(width: 36, height: 36)
                .foregroundStyle(colors.mainColor)
                .onTapGesture {
                    isShowing.toggle()
                }
            Spacer()
            Image(systemName: "bell")
                .resizable()
                .frame(width: 36, height: 36)
                .foregroundStyle(colors.mainColor)
                .onTapGesture {
                }
        }
        .padding(Spacing.mm)
    }
}

#Preview {
    @Previewable var r = Router()
    let photosVM = ProfilePicViewModel.mock()
    let a = AppState.mockAuthenticated()
    HomeMenuTopbar(isShowing: .constant(false))
        .environmentObject(photosVM)
        .environmentObject(a)
        .environment(r)
        .withAppColors()
}

