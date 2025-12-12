//
//  ContactoComponent.swift
//  Proyecto Roshkapp
//
//  Created by Bootcamp on 2025-12-11.
//

import SwiftUI

struct ProfileComponentInfo: View {
    let icon : String
    let value : String
    var body: some View {
        HStack{
            Image(systemName: icon)
                .foregroundStyle(Color.mainColor)
            Spacer()
            Text(value)
                .foregroundStyle(Color.mainColor)
            Spacer()
        }
        .padding()
        .background(Color.altBGColor)
        .clipShape(RoundedRectangle(cornerRadius: 16))
    }
}

struct ProfileComponentInfoCustomIcon: View {
    let icon : String
    let value : String
    var body: some View {
        HStack{
            Image(icon)
                .foregroundStyle(Color.mainColor)
            Spacer()
            Text(value)
                .foregroundStyle(Color.mainColor)
            Spacer()
        }
        .padding()
        .background(Color.altBGColor)
        .clipShape(RoundedRectangle(cornerRadius: 16))
    }
}


#Preview {
    ProfileComponentInfo(icon: "envelope", value: "aa@roshka.com")
}
