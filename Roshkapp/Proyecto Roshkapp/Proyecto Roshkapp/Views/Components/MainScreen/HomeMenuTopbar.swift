//
//  HomeMenuTopbar.swift
//  Proyecto Roshkapp
//
//  Created by Bootcamp on 2025-12-04.
//

import SwiftUI

struct HomeMenuTopbar: View {
    let user: UserModel
    var editable: Bool = true
    var body: some View {
        HStack(alignment: .center){
            UserWelcome(user: user, editable: editable)
            Spacer()
            Image(systemName: "bell")
                .resizable()
                .frame(width: 36, height: 36)
                .foregroundStyle(Color.mainColor)
            Image("logout.icon")
                .resizable()
                .frame(width: 36, height: 36)
                .foregroundStyle(Color.mainColor)
        }
        .padding(Spacing.xs)
    }
}

/*
#Preview {
    @Previewable let photosVM = PhotoViewModel()
    let user = UserModel.mockUser
    HomeMenuTopbar(user: user)
        .environmentObject(photosVM)
}
*/
