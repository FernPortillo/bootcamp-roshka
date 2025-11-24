//
//  DailyScrum.swift
//  Test1
//
//  Created by Bootcamp on 2025-11-24.
//

import Foundation
import ThemeKit

struct DailyScrum : Identifiable{
    let id : UUID
    var title : String
    var attendees : [Attendee]
    var lengthInMinutes : Int
    var lengthInMinutesAsDouble : Double{
        get{
            Double(lengthInMinutes)
        }
        set{
            lengthInMinutes = Int(newValue)
        }
    }
    
    
    var theme : Theme
    
    
    // Pedis todavia strings nomas para el nombre
    init(id: UUID = UUID(), title: String, attendees: [String], lengthInMinutes : Int, theme : Theme)
    {
        self.id = id
        self.title = title
        self.attendees = attendees.map{ Attendee(nombre: $0)} // $0 es el primer argumento en el ciclo
        self.lengthInMinutes = lengthInMinutes
        self.theme = theme
    }
    
}

extension DailyScrum {
    // Por si tienen el mismo nombre
    struct Attendee: Identifiable{
        let id : UUID
        var nombre : String
        
        init(id: UUID = UUID(), nombre: String)
        {
            self.id = id
            self.nombre = nombre
        }
    }
    
    static var emptyScrum: DailyScrum {
        DailyScrum(title: "", attendees: [], lengthInMinutes: 5, theme: .sky)
    }
}
