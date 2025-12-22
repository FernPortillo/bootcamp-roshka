//
//  StatusSolicitud.swift
//  Proyecto Roshkapp
//
//  Created by Bootcamp on 2025-12-15.
//

import SwiftUI

struct StatusSolicitud: View {
    @Environment(\.appColors) var colors
    let status : String
    var body: some View {
        var backgroundColor : Color {
            switch status{
            case "P":
                return colors.accentLighter
            case "R":
                return colors.deniedBackgroundColor
            case "A":
                return colors.approvedBackgroundColor
            default:
                return colors.mainColor
            }
        }
        
        var textColor : Color {
            switch status{
            case "P":
                return colors.pendingTextColor
            case "R":
                return colors.deniedTextColor
            case "A":
                return colors.approvedTextColor
            default:
                return colors.accentColor
            }
        }
        var statusText : String {
            switch status {
            case "P":
                return "Pendiente"
            case "R":
                return "Rechazado"
            case "A":
                return "Aprobado"
            default:
                return "Placeholder"
            }
        }

        ZStack{
            RoundedRectangle(cornerRadius: 16)
                .frame(width: 85, height: 30)
                .foregroundStyle(backgroundColor)
            HStack{
                Circle()
                    .frame(width: 8)
                    .foregroundStyle(textColor)
                Text(statusText)
                    .font(.regularSmaller)
                    .foregroundStyle(textColor)
            }
        }
    }
}

#Preview {
    StatusSolicitud(status: "R")
        .withAppColors()
}
