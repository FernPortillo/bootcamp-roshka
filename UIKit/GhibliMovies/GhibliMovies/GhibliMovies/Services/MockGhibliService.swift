//
//  MockGhibliService.swift
//  GhibliMovies
//
//  Created by Bootcamp on 2025-11-30.
//

import Foundation

struct MockGhibliService : GhibliServices {
    
    private struct SampleData: Decodable{
        let films: [GMFilm]
        let people: [GMPerson]
    }
    
    private func loadSampleData() throws -> SampleData {
        guard let url = Bundle.main.url(forResource: "SampleData", withExtension: "json") else {
            throw APIError.invalidURL
        }
        
        do{
            let data = try Data(contentsOf: url)
            return try JSONDecoder().decode(SampleData.self, from: data)
        }
        catch let error as DecodingError {
            throw APIError.decodingError(error)
        }
        catch{
            throw APIError.networkError(error)
        }
    }

    //MARK: - paara probar con Sample
    func fetchFilms() async throws -> [GMFilm] {
        let data = try loadSampleData()
        return data.films
    }
    func fetchPerson(from URLString: String) async throws -> GMPerson {
        let data = try loadSampleData()
        return data.people.first!
    }
    
    //MARK: - paara preview only
    func fetchFilm() -> GMFilm{
        let data = try! loadSampleData()
        return data.films.first!
    }

}
