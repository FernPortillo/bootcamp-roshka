//
//  GMFilm.swift
//  GhibliMovies
//
//  Created by Bootcamp on 2025-11-30.
//

import Foundation

struct GMFilm: Codable, Identifiable, Equatable, Hashable
{
    let id: String
    let title: String
    let description : String
    let director: String
    let producer : String

    let image: String
    let bannerImage : String
    let releaseYear: String
    let durationInMinutes : String
    let score : String
    
    let people : [String]
    
    enum CodingKeys : String, CodingKey {
        case id, title, image, description, producer, people, director
        
        case bannerImage = "movie_banner"
        
        case releaseYear = "release_date"
        case durationInMinutes = "running_time"
        case score = "rt_score"
    }
    
    
    //MARK: Preview Movie para detail
    static var exampleFilm : GMFilm {
        
        let bannerURL = URL.convertAssetImage(forImageNamed: "imageBanner")
        let posterURL = URL.convertAssetImage(forImageNamed: "movieImage")
        
        return GMFilm(
            id: "id",
            title: "My Neighbor Totoro",
            description: "Two sisters move to the country with their father in order to be closer to their hospitalized mother, and discover the surrounding trees are inhabited by Totoros, magical spirits of the forest. When the youngest runs away from home, the older sister seeks help from the spirits to find her.",
            director: "Hayao Miyazaki",
            producer: "Hayao Miyazaki",
            image: bannerURL?.absoluteString ?? "",
            bannerImage: posterURL?.absoluteString ?? "",
            releaseYear: "1988",
            durationInMinutes: "86",
            score: "93",
            people: ["https://ghibliapi.vercel.app/people/986faac6-67e3-4fb8-a9ee-bad077c2e7fe"]
        )
    }
}


/// Moooooy cheto, permite hacer un call a la API desde el playground, y muestra el resultado del
/// objeto debajo, para ver si funciona y/o si no funciona, que te diga el error
/*
import Playgrounds

#Playground {
    let url = URL(string: "https://ghibliapi.vercel.app/films/")!
    
    do{
        let (data, response) = try await URLSession.shared.data(from: url)
        
        try JSONDecoder().decode([GMFilm].self, from:data)
    }
    catch
    {
        print(error)
    }
}
*/

