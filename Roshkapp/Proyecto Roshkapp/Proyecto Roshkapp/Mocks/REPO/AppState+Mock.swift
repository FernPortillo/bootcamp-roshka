//
//  AppState+Mock.swift
//  Proyecto Roshkapp
//
//  Created by Bootcamp on 2025-12-04.
//


extension AppState {
    static func mockAuthenticated() -> AppState {
        let state = AppState()
        state.isAuthenticated = true
        return state
    }
    
    static func mockNotAuthenticated() -> AppState {
        let state = AppState()
        state.isAuthenticated = false
        return state
    }
}
