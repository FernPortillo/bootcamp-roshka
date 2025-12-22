//
//  NavigationContainer.swift
//  Proyecto Roshkapp
//
//  Created by Bootcamp on 2025-12-18.
//

import Foundation
import SwiftUI

struct NavigationContainer<Content: View>: View {
    @EnvironmentObject var photosVM: ProfilePicViewModel
    @EnvironmentObject var appState: AppState
    @State var router: Router = Router()
    let content : Content
    
    init(@ViewBuilder content: @escaping () -> Content) {
        self.content = content()
    }
    
    var body: some View {
        NavigationStack(path: $router.navPath){
            content
                .navigationDestination(for: PushDestination.self){ destination in
                    view(for: destination)
                        .environmentObject(photosVM)
                        .environmentObject(appState)
                }
        }
        .environment(router)
    }
}
