//
//  ScrumsView.swift
//  Test1
//
//  Created by Bootcamp on 2025-11-24.
//

import SwiftUI
import ThemeKit

struct ScrumsView: View {
    @Binding var scrums : [DailyScrum]
    @State private var isAddingScrum : Bool = false
    
    var body: some View {
        NavigationStack {
            List($scrums) { $scrum in
                NavigationLink(destination: DetailView(scrum: $scrum)){
                    CardView(scrum: scrum)
                }
                .listRowBackground(scrum.theme.mainColor)
            }
            .navigationTitle("Daily Scrums")
            .toolbar
            {
                Button(action : {isAddingScrum = true})
                {
                    Image(systemName: "plus")
                }
                .accessibilityLabel("Add scrum")
            }
            .sheet(isPresented: $isAddingScrum)
            {
                NewScrumView(scrums: $scrums)
            }
        }
    }
}
    
    #Preview {
        @Previewable @State var scrums = DailyScrum.ScrumSampleData
        ScrumsView(scrums: $scrums)
    }

