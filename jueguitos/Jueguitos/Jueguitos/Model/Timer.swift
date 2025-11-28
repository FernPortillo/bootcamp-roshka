//
//  Timer.swift
//  Jueguitos
//
//  Created by Bootcamp on 2025-11-26.
//

import Foundation
import Combine

let TIEMPO_JUEGO_EN_SEGS = 30
let TIEMPO_RESPAWN_EN_SEGS = 1.0
let TIEMPO_RESPAWN_STUN = 6.5

final class TimerGame : ObservableObject{
    @Published var timeRemaining : Int = TIEMPO_JUEGO_EN_SEGS
    @Published var timeUntilNextRespawn : Double = TIEMPO_RESPAWN_EN_SEGS
    @Published var isRunning : Bool = false
    @Published var onRespawn : ()->Void = {}
    private var timerTask: Task<Void, Error>? // Success -> Void, Error -> Error
    private var respawnTask: Task<Void, Error>?
    private var respawnTimeNanoseconds : UInt64 = 1_000_000_000
    private var isPaused : Bool = false
    
    @MainActor // Hilo principal
    func startTimerJuego(totalSeconds : Int)
    {
        timerTask?.cancel()
        
        self.timeRemaining = totalSeconds
        
        timerTask = Task { @MainActor in
            while (!Task.isCancelled && timeRemaining > 0)
            {
                timeRemaining -= 1
                try? await Task.sleep(nanoseconds: 1_000_000_000)
            }
            isRunning = false
        }
    }
    
    @MainActor
    func startTimerRespawn(seconds : Double)
    {
        respawnTask?.cancel()
        self.timeUntilNextRespawn = seconds
        
        respawnTask = Task { @MainActor in
            while(!Task.isCancelled && timeRemaining > 0){
                
                
                while isPaused && timeRemaining > 0
                {
                    try? await Task.sleep(nanoseconds: 100_000_000)
                }
                
                try? await Task.sleep(nanoseconds: respawnTimeNanoseconds)
                
                if Task.isCancelled{break}
                print("Tengo que moverme")
                respawn()
            }
        }
    }
    
    @MainActor
    func pause(seconds: UInt64)
    {
        isPaused = true
        Task { @MainActor in
            try? await Task.sleep(nanoseconds: seconds * 1_000_000_000)
            isPaused = false
        }
    }
    
    private func respawn()
    {
        respawnTimeNanoseconds = 1_000_000_000
        // Llamar al movimiento
    }
    
    
    
    func resetTimer() {
        timerTask?.cancel()
    }
    
    deinit{
        timerTask?.cancel()
        respawnTask?.cancel()
        isRunning.toggle()
    }
}
