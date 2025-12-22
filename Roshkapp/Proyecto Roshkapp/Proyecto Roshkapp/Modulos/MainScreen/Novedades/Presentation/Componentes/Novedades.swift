//
//  NovedadesComponent.swift
//  Proyecto Roshkapp
//
//  Created by Bootcamp on 2025-12-09.
//

import SwiftUI

struct NovedadesManager: View {
    let novedades: [NovedadesModel]
    var body: some View {
        VStack(alignment: .leading){
            Text("Avisos")
                .font(.boldMedium)
                .padding(.horizontal, Spacing.mm)
            Divider()
            ForEach(novedades, id: \.idNovedades) { novedad in
                NovedadesText(novedad: novedad)
            }
        }
    }
}

#Preview {
    @Previewable var r = Router()
    let p = ProfilePicViewModel.mock()
    let a = AppState.mockAuthenticated()
    NovedadesManager(novedades: NovedadesModel.mockNovedadText)
        .environmentObject(p)
        .environmentObject(a)
        .environment(r)
        .withAppColors()
}






