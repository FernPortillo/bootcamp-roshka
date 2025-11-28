//
//  GameViewModel.swift
//  Jueguitos
//
//  Created by Bootcamp on 2025-11-26.
//

import Foundation
import Combine

enum GameState {
    case Playing
    case NotPlaying
}

class GameViewModel : ObservableObject{
    @Published var gameState : GameState = .NotPlaying
    @Published var puntos : Int = 0
    @Published var posicion : CGPoint = CGPoint(x: 50, y: 50)
    @Published var width : CGFloat = CGFloat.zero
    @Published var height : CGFloat = CGFloat.zero
        
    // Al declarar la clase como observable object se usa ->
    @Published var timerJuego : TimerGame
    
    weak var uiState : UIState?

    private var cancellables = Set<AnyCancellable>()

    let imageSize : CGFloat = 100
    
    init(timer: TimerGame = TimerGame(), uiState : UIState? = nil)
    {
        self.timerJuego = timer
        self.uiState = uiState
        setupSubscribers()
    }
    
    func setupSubscribers()
    {
        // Evento que avisa que el objeto cambio, pero sin usar observable object aca adentro
        timerJuego.objectWillChange
            .sink { [weak self] value in
                self?.objectWillChange.send()
            }
            .store(in: &cancellables)
        
        timerJuego.$timeUntilNextRespawn
            .sink { [weak self] value in
                if value == 0{
                    self?.updatePosition()
                }
            }
            .store(in: &cancellables)
        
        
        timerJuego.$timeRemaining
            .sink { [weak self] value in
                if value == 0 {
                    self?.endGame()
                }
            }
            .store(in: &cancellables)
    }
    
    
    func onTap()
    {
        guard gameState == .Playing else {return}
        
        puntos += 1
        updatePosition()
        timerJuego.pause(seconds: 5)
        
    }
    
    private func updatePosition()
    {
        posicion.x = changeTopoPositionValue(axis: width, imageSize: imageSize)
        posicion.y = changeTopoPositionValue(axis: height, imageSize: imageSize)
    }
    
    func startGame()
    {
        print("esconder tab bar")
        puntos = 0
        gameState = .Playing
        timerJuego.startTimerJuego(totalSeconds: 30)
        timerJuego.startTimerRespawn(seconds: 6.5)
        uiState?.isTabBarVisible = false
        updatePosition()
    }
    
    func endGame()
    {
        gameState = .NotPlaying
        uiState?.isTabBarVisible = true
        print("mostrar tab bar")

        // Guardar
    }
    
    private func changeTopoPositionValue(axis: CGFloat, imageSize: CGFloat) -> CGFloat
    {
        // El anchor esta en el MEDIO no en top left como una app normal -_-
        let half = imageSize / 2
        
        let min = half
        let max  = axis - half
        
        let val = CGFloat.random(in: min...max)
        return val
    }
    
}
