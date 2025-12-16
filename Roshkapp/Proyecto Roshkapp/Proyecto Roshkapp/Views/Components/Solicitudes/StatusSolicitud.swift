//
//  StatusSolicitud.swift
//  Proyecto Roshkapp
//
//  Created by Bootcamp on 2025-12-15.
//

import SwiftUI

struct StatusSolicitud: View {
    let status : String
    var body: some View {
        var backgroundColor : Color {
            switch status{
            case "P":
                return Color.accentLighter
            case "R":
                return Color.deniedBackgroundColor
            case "A":
                return Color.approvedBackgroundColor
            default:
                return Color.mainColor
            }
        }
        
        var textColor : Color {
            switch status{
            case "P":
                return Color.pendingTextColor
            case "R":
                return Color.deniedTextColor
            case "A":
                return Color.approvedTextColor
            default:
                return Color.accentColor
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
                .frame(width: 80, height: 30)
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
}
