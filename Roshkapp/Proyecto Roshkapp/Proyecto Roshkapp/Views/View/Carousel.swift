//
//  Carousel.swift
//  Proyecto Roshkapp
//
//  Created by Bootcamp on 2025-12-09.
//
import Combine
import SwiftUI

struct InfiniteCarouselView : View {
    @State private var currentIndex = 0
    @State private var scrollPosition : String?
    
    let timer = Timer.publish(every: 5, on: .main, in: .common).autoconnect()
    
    let nombreImagenes : [String] = ["1", "2", "3", "4", "5", "6", "7"]
    
    var body: some View{
        VStack{
            ScrollView(.horizontal){
                LazyHStack {
                    ForEach(nombreImagenes, id: \.self) {nombre in
                        CarouselCard(imageName: nombre)
                            .containerRelativeFrame(.horizontal,
                                                    count: 1,
                                                    spacing: 32)
                            .scrollTransition{ content, phase in
                                content
                                    // Si esta en la pantalla
                                    .opacity(phase.isIdentity ? 1.0 : 0.75)
                            }
                    }
                }
                .frame(height: 200)
                .scrollTargetLayout()
            }
            CarouselProgressIndicator(
                currentIndex: currentIndex,
                scrollPosition: $scrollPosition,
                imagenes: nombreImagenes)
        }
        .scrollIndicators(.hidden)
        .scrollPosition(id: $scrollPosition)
        .scrollTargetBehavior(.viewAligned)
        .contentMargins(Spacing.l, for: .scrollContent)
        .onChange(of: scrollPosition) { oldValue, newValue in
            if let newValue, let index = nombreImagenes.firstIndex(of: newValue) {
                currentIndex = index
            }
        }
        .onReceive(timer) { _ in
            withAnimation(.smooth){
                let nextIndex = (currentIndex + 1) % nombreImagenes.count
                scrollPosition = nombreImagenes[nextIndex]
                currentIndex = nextIndex
            }
        }
    }
}





struct CarouselCard: View {
    let imageName: String
    var body: some View {
        Image(imageName)
            .resizable()
            .scaledToFill()
            .frame(width: 300, height: 240)
            .clipShape(RoundedRectangle(cornerRadius: Spacing.m))
            .padding(.horizontal, Spacing.m)
            .shadow(color: .black.opacity(0.3) ,radius: 4, x: 0, y: 4)
            .onTapGesture {
                print("Llevame a la pagina")
            }
    }
}

#Preview {
    InfiniteCarouselView()
}
