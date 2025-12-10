//
//  NovedadesText.swift
//  Proyecto Roshkapp
//
//  Created by Bootcamp on 2025-12-09.
//

import SwiftUI
// Limite es 42 letras

struct NovedadesText: View {
    @State private var isNovedadFullyVisible = false
    @State private var lineLimit = 1
    let autor : String
    //let tiempoPublicacion : String
    let titulo : String
    let descripcion: String
    var body: some View {
        let isNovedadTextoLongEnough = descripcion.count > 55
        VStack(alignment: .leading) {
            HStack{
                ProfilePic()
                VStack(alignment: .leading){
                    Text(autor)
                        .font(.regularMedium)
//                    Text(tiempoPublicacion)
//                        .font(.regularSmaller)
                    
                }
                Spacer()
                if isNovedadTextoLongEnough{
                    Image(isNovedadFullyVisible ? "arrow.up.icon" : "arrow.down.icon")
                        .onTapGesture{
                            isNovedadFullyVisible.toggle()
                            
                            if isNovedadFullyVisible {
                                lineLimit = 12
                            }
                            else {
                                lineLimit = 1
                            }
                        }
                }
            }
            .padding()
            VStack(alignment: .leading){
                Text(titulo)
                    .font(.boldSmall)
                Text(descripcion)
                    .font(.regularSmall)
                    .lineSpacing(Letter.ls_wide)
                    .lineLimit(lineLimit)
            }
            .padding(.horizontal)
        }
        .padding(Spacing.m)
    }
}

#Preview {
    NovedadesText(
        autor: "Fulano deTal",
//        tiempoPublicacion: "Hace 1 semana",
        titulo: "Recordatorio",
        descripcion: "A veces esto no va a funcionar correctamente, pero 55 es el numero magico segun parece")
}
