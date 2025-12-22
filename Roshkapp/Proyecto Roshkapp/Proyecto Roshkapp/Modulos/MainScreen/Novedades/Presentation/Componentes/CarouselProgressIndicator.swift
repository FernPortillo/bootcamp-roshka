//
//  CarouselProgressIndicator.swift
//  Proyecto Roshkapp
//
//  Created by Bootcamp on 2025-12-09.
//
import SwiftUI


struct CarouselProgressIndicator : View {
    @Environment(\.appColors) var colors
    let currentIndex : Int
    @Binding var scrollPosition : String?
    let novedades: [NovedadesModel]
    var body: some View {
        HStack{
            ForEach(0..<novedades.count, id: \.self) { index in
                Button
                    {
                        withAnimation(.smooth){
                            scrollPosition = novedades[index].imagenUrl
                        }
                    }
                 label: {
                    Rectangle()
                         .fill(index == currentIndex ? colors.accentColor : colors.darkerBackgroundColor)
                        .frame(width: Spacing.s, height: Spacing.s)
                        .rotationEffect(Angle(degrees: 45))
                }
            }
        }
    }
}
