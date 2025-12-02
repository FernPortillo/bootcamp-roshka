//
//  UCCGetAllCharactersRespones.swift
//  UIKitCrashCourse
//
//  Created by Bootcamp on 2025-11-28.
//

import Foundation

struct UCCGetAllCharactersResponse : Codable, Sendable
{
    struct Info : Codable {
        let count : Int
        let pages : Int
        let next : String?
        let prev : String?
    }
    
    let info: Info
    let results: [UCCCharacters]
}
