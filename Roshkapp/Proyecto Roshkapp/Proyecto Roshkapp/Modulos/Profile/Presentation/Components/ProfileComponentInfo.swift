//
//  ContactoComponent.swift
//  Proyecto Roshkapp
//
//  Created by Bootcamp on 2025-12-11.
//

import SwiftUI

struct ProfileComponentInfo: View {
    @Environment(\.appColors) var colors
    let icon : String
    let value : String
    var body: some View {
        HStack{
            Image(systemName: icon)
                .foregroundStyle(colors.mainColor)
            Spacer()
            Text(value)
                .foregroundStyle(colors.mainColor)
            Spacer()
        }
        .padding()
        .background(colors.darkBackgroundColor)
        .clipShape(RoundedRectangle(cornerRadius: Spacing.m))
    }
}

struct ProfileComponentInfoCustomIcon: View {
    @Environment(\.appColors) var colors
    let icon : String
    let value : String
    var body: some View {
        HStack{
            Image(icon)
                .foregroundStyle(colors.mainColor)
            Spacer()
            Text(value)
                .foregroundStyle(colors.mainColor)
            Spacer()
        }
        .padding()
        .background(colors.altBGColor)
        .clipShape(RoundedRectangle(cornerRadius: Spacing.m))
    }
}


#Preview {
    ProfileComponentInfo(icon: "envelope", value: "aa@roshka.com")
}
