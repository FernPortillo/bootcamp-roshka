
// deberia de hacer las func de guardar puntos

import SwiftUI

let imageSize : CGFloat = 100

struct GameView: View {
    @EnvironmentObject var uiState : UIState
    @StateObject var gameVM = GameViewModel()
    
    var body: some View {
            VStack{
                HStack {
                    Text("\(gameVM.puntos) puntos")
                    Text("\(gameVM.timerJuego.timeRemaining) segundos" )
                }
                GeometryReader { geometry in
                    ZStack {
                        Rectangle()
                            .fill(Color.green)
                        Image("Topo")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: imageSize, height: imageSize)
                            .position(gameVM.posicion)
                            .onTapGesture {
                                gameVM.onTap()
                            }
                    }
                    .onAppear{
                        gameVM.width = geometry.size.width
                        gameVM.height = geometry.size.height
                    }
                }
                
                if gameVM.gameState == .NotPlaying
                {
                    Button(action: {gameVM.startGame()})
                    {
                        Text("Jugar")
                            .padding(.horizontal).padding(.vertical, 8)
                            .tint(Color.black)
                    }
                    .background(Color.gray)
                    .cornerRadius(16)
                }
            }
            .toolbar(gameVM.gameState == .Playing ? .hidden : .visible, for: .tabBar)
            .onAppear{
                gameVM.uiState = uiState
            }
            .padding()
    }
}



#Preview {
    GameView()
        .environmentObject(UIState())
}
