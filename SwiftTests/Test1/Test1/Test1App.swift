//
//  Test1App.swift
//  Test1
//
//  Created by Bootcamp on 2025-11-24.
//

import SwiftUI

@main
struct Test1App: App {
    var body: some Scene {
        WindowGroup {
            @State var scrums = DailyScrum.ScrumSampleData
            ScrumsView(scrums: $scrums)
        }
    }
}
