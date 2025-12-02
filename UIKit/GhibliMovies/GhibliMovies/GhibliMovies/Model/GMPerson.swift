//
//  GMPerson.swift
//  GhibliMovies
//
//  Created by Bootcamp on 2025-11-30.
//

import Foundation

struct GMPerson : Codable, Identifiable, Equatable
{
    let id: String
    let name: String
    let gender : String
    let age: String
    let eyeColor: String
    let hairColor: String
    let films : [String]
    let species: String
    let url: String

    
    enum CodingKeys : String, CodingKey {
        case id, name, gender, age, films, species, url
        case eyeColor = "eye_color"
        case hairColor = "hair_color"
    }
}


/// Moooooy cheto
import Playgrounds

#Playground {
    let url = URL(string: "https://ghibliapi.vercel.app/people/")!
    
    do{
        let (data, response) = try await URLSession.shared.data(from: url)
        
        try JSONDecoder().decode([GMPerson].self, from:data)
    }
    catch
    {
        print(error)
    }
}



