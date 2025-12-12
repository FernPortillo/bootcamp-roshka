//
//  CarouselProgressIndicator.swift
//  Proyecto Roshkapp
//
//  Created by Bootcamp on 2025-12-09.
//
import SwiftUI


struct CarouselProgressIndicator : View {
    let currentIndex : Int
    @Binding var scrollPosition : String?
    let imagenes: [String]
    var body: some View {
        HStack{
            ForEach(0..<imagenes.count, id: \.self) { index in
                Button
                    {
                        withAnimation(.smooth){
                            scrollPosition = imagenes[index]
                        }
                    }
                 label: {
                    Rectangle()
                         .fill(index == currentIndex ? Color.accentColor : Color.darkerBackgroundColor)
                        .frame(width: Spacing.s, height: Spacing.s)
                        .rotationEffect(Angle(degrees: 45))
                }
            }
        }
    }
}
