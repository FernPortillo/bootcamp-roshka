//
//  Carousel.swift
//  Proyecto Roshkapp
//
//  Created by Bootcamp on 2025-12-09.
//
import Combine
import SwiftUI

struct InfiniteCarouselView : View {
    @Environment(Router.self) private var router : Router
    @State private var currentIndex = 0
    @State private var scrollPosition : String?
    var novedades : [NovedadesModel] = NovedadesModel.mockCarrusel
    var permisosTH = false
    let timer = Timer.publish(every: 3, on: .main, in: .common).autoconnect()

    var body: some View{
        VStack{
            ScrollView(.horizontal){
                LazyHStack {
                    ForEach(novedades) {novedad in
                        CarouselCard(novedad: novedad)
                            .containerRelativeFrame(.horizontal,
                                                    count: 1,
                                                    spacing: 32)
                            .scrollTransition{ content, phase in
                                content
                                    // Si esta en la pantalla
                                    .opacity(phase.isIdentity ? 1.0 : 0.75)
                            }
                            .onTapGesture {
                                router.navigate(to: .novedadesFullScreen(novedad: novedad, permisosTH: permisosTH))
                            }
                            .id(novedad.imagenUrl) // Se necesita para poder mover el carrusel, por mas que sea ya identifiable
                    }
                }
                .frame(height: 200)
                .scrollTargetLayout()
            }
            .scrollIndicators(.hidden)
            .scrollPosition(id: $scrollPosition)
            .scrollTargetBehavior(.viewAligned)
            .contentMargins(Spacing.l, for: .scrollContent)
            CarouselProgressIndicator(
                currentIndex: currentIndex,
                scrollPosition: $scrollPosition,
                novedades: novedades)
        }
        .onChange(of: scrollPosition) { oldValue, newValue in
            if let newValue, let index = novedades.firstIndex(where: {$0.imagenUrl == newValue}) {
                currentIndex = index
            }
        }
        .onReceive(timer) { _ in
            withAnimation(.smooth){
                currentIndex = (currentIndex + 1) % novedades.count
                scrollPosition = novedades[currentIndex].imagenUrl
            }
        }
    }
}





struct CarouselCard: View {
    let novedad: NovedadesModel
    var body: some View {
        AsyncImageLoader(urlString: novedad.imagenUrl!)
            .scaledToFill()
            .frame(width: 300, height: 240)
            .clipShape(RoundedRectangle(cornerRadius: Spacing.m))
            .padding(.horizontal, Spacing.m)
            .shadow(color: .black.opacity(0.3) ,radius: 4, x: 0, y: 4)
    }
}

#Preview {
    @Previewable var r = Router()
    let p = ProfilePicViewModel.mock()
    InfiniteCarouselView()
        .environmentObject(p)
        .environment(r)
}
