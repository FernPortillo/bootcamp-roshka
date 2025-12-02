//
//  DefaultGhibliServices.swift
//  GhibliMovies
//
//  Created by Bootcamp on 2025-11-30.
//

import Foundation

struct DefaultGhibliServices : GhibliServices
{
    
    func fetch<T: Decodable>(from URLString: String,type: T.Type) async throws -> T
    {
        guard let url = URL(string: URLString) else {
            throw APIError.invalidURL
        }
        
        do{
            let (data, response) = try await URLSession.shared.data(from: url)
            
            guard let httpResponse = response as? HTTPURLResponse,
                    (200...299).contains(httpResponse.statusCode) else {
                throw APIError.invalidResponse
            }
            
            return try JSONDecoder().decode(type, from:data)
        }
        catch let error as DecodingError
        {
            throw APIError.decodingError(error)
        }
        catch let error as URLError
        {
            throw APIError.networkError(error)
        }
    }
    
    
    
    func fetchFilms() async throws -> [GMFilm] {
        return try await fetch(from: Endpoints.film.rawValue, type: [GMFilm].self)
    }
    
    func fetchPerson(from URLString: String) async throws -> GMPerson {

        return try await fetch(from: URLString, type: GMPerson.self)
    }
}
