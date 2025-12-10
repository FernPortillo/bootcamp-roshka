//
//  NovedadesComponent.swift
//  Proyecto Roshkapp
//
//  Created by Bootcamp on 2025-12-09.
//

import SwiftUI

struct NovedadesComponent: View {
    let novedades: [NovedadesModel]
    var body: some View {
        VStack(alignment: .leading){
            Text("Avisos")
                .font(.boldMedium)
                .padding(.horizontal, Spacing.mm)
            ForEach(novedades, id: \.idNovedades) { novedad in
                NovedadesText(
                    autor: NovedadesModel.getNombreNovedad(novedad: novedad),
                    titulo: novedad.titulo,
                    descripcion: novedad.descripcion)
            }
        }
    }
}


#Preview {
    var novedades = NovedadesModel.mockNovedadText
    var sortedMock = novedades.sorted { $0.prioridad && !$1.prioridad}
    NovedadesComponent(novedades: sortedMock)
}

