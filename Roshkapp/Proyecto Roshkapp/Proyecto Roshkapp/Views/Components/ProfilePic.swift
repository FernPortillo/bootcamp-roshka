//
//  ProfilePic.swift
//  Proyecto Roshkapp
//
//  Created by Bootcamp on 2025-12-09.
//

import SwiftUI

struct ProfilePic: View {
    var body: some View {
        Image("generic.avatar")
            .onTapGesture {
                print("Ir al perfil")
            }
    }
}

#Preview {
    ProfilePic()
}
