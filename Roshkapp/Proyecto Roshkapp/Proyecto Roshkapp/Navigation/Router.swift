//
//  Router.swift
//  Proyecto Roshkapp
//
//  Created by Bootcamp on 2025-12-18.
//

import Foundation
import SwiftUI
import Combine

@Observable
final class Router{
    var navPath: [PushDestination] = []
}


extension Router{
    func navigate(to destination: PushDestination){
        if navPath.last == destination {
            return
        }
        navPath.append(destination)
    }
    
    func navigateBack(){
        guard !navPath.isEmpty else { return }
        navPath.removeLast()
    }
    
    func navigateToRoot(){
        navPath.removeAll()
    }
}
