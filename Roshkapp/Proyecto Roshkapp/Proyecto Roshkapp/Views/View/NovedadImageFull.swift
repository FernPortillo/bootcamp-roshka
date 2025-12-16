//
//  NotificacionImageFull.swift
//  Proyecto Roshkapp
//
//  Created by Bootcamp on 2025-12-15.
//

import SwiftUI

struct NovedadImageFull: View {
    let novedad : NovedadesModel
    var body: some View {
        let imagenUrl = novedad.imagenUrl ?? ""
        ScrollView{
            VStack(alignment: .leading)
            {
                Image("1")
                    .resizable()
                    .scaledToFit()
                    .padding()
            }
        }
        .background(Color.appBackgroundColor)
    }
}

#Preview {
    @Previewable var photosVM = ProfilePicViewModel.mock()
    let novedad = NovedadesModel.mockNovedadConImagen
    NovedadImageFull(novedad: novedad)
        .environmentObject(photosVM)
}
