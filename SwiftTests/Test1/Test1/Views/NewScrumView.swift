//
//  NewScrumView.swift
//  Test1
//
//  Created by Bootcamp on 2025-11-25.
//

import SwiftUI

struct NewScrumView: View {
    @State private var newScrum : DailyScrum = DailyScrum.emptyScrum
    
    @Binding var scrums : [DailyScrum]
    var body: some View {
        NavigationStack
        {
            DetailEditView(
                scrum: $newScrum,
                saveEdits: {dailyScrum in scrums.append(newScrum)})
        }
    }
}

#Preview {
    NewScrumView(scrums: .constant(DailyScrum.ScrumSampleData),)
}
