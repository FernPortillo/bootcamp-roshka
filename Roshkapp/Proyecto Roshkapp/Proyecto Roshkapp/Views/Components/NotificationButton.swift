//
//  NotificationButton.swift
//  Proyecto Roshkapp
//
//  Created by Bootcamp on 2025-12-04.
//

import SwiftUI

struct NotificationButton: View {
    let cantidad_notificaciones: String
    var body: some View {
        ZStack {
            Image(systemName: "bell")
                .resizable()
                .frame(width: 36, height: 36)
                .foregroundStyle(Color.mainColor)
           Circle()
               .frame(width: Spacing.mm, height: Spacing.mm)
               .offset(x: 15, y: -15)
               .foregroundStyle(Color.deniedBackgroundColor)
            Text(cantidad_notificaciones)
                .font(.blackSmall)
                .offset(x: 15, y: -15)
                .foregroundStyle(Color.white)
        }
    }
}

#Preview {
    NotificationButton(cantidad_notificaciones: "1")
}
