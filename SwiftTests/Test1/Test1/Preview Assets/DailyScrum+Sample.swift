//
//  DailyScrum+Sample.swift
//  Test1
//
//  Created by Bootcamp on 2025-11-24.
//

import Foundation
import ThemeKit

extension DailyScrum
{
    static let ScrumSampleData : [DailyScrum] =
    [
        DailyScrum(title: "Design",
                   attendees: ["Maria", "Juan", "Hector"],
                   lengthInMinutes: 30,
                   theme: .indigo),
        DailyScrum(title: "Bootcamp",
                   attendees: ["Julio", "Edu", "Fer"],
                   lengthInMinutes: 120,
                   theme: .orange),
        DailyScrum(title: "WebDev",
                   attendees: ["Fulano", "Mengano", "Jennifer",
                              "Julian", "Diego", "Roberto",
                              "Aron", "Perla"],
                   lengthInMinutes: 40,
                   theme: .magenta)
    ]
    
}
