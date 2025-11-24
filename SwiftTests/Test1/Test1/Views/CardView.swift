//
//  CardView.swift
//  Test1
//
//  Created by Bootcamp on 2025-11-24.
//

import SwiftUI
import ThemeKit

struct CardView: View {
    let scrum : DailyScrum
    var body: some View {
        VStack(alignment: .leading)
        {
            Text(scrum.title)
                .font(.headline)
                .accessibilityAddTraits(.isHeader)
            Spacer()
            HStack
            {
                Label("\(scrum.attendees.count)", systemImage: "person.3")
                    .accessibilityLabel("\(scrum.attendees.count) attendees")
                Spacer()
                Label("\(scrum.lengthInMinutes)", systemImage: "clock")
                    .labelStyle(.trailingIcon)
                    .accessibilityLabel("\(scrum.lengthInMinutes) attendees")
            }
            .font(.caption)
        }
        .padding()
        .foregroundStyle(scrum.theme.accentColor)
    }
}

#Preview(traits: .fixedLayout(width: 400, height: 60)) {
    let scrum = DailyScrum.ScrumSampleData[0]
    return CardView(scrum: scrum)
        .background(scrum.theme.mainColor)
}
