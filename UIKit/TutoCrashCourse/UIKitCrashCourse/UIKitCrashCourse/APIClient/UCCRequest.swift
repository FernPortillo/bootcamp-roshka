//
//  UCCRequest.swift
//  UIKitCrashCourse
//
//  Created by Bootcamp on 2025-11-28.
//

import Foundation

/// Representa una call unica a la API
final class UCCRequest
{
    // BASE URL
    // ENDPOINTS
    // PATH
    // QUERY PARAMETERS
    // GENERICS
    
    private struct Constants {
        static let baseUrl = "https://rickandmortyapi.com/api"
    }
    
    private let endpoint : UCCEndpoint
    
    private let pathComponents : [String]
    
    /// Query para obtener mas datos de una request, requiere (nombre: String, valor: String?)
    private let queryParameters : [URLQueryItem]
    
    /// Hace la URL usada en formato String
    private var generateUrlString : String {
        var string = Constants.baseUrl
        string += "/"
        string += endpoint.rawValue
        
        if !pathComponents.isEmpty {
            string += "/"
            pathComponents.forEach({
                string += "\($0)"
            })
        }
        
        if !queryParameters.isEmpty {
            string += "?"
            let argumentString = queryParameters.compactMap({
                guard let value = $0.value else {return nil}
                return "\($0.name)=\(value)"
            }).joined(separator: "&")
            
            string += argumentString
        }
        print(string)
        return string
    }
    
    public let httpMethod = "GET"
    
    public var url: URL? {
        return URL(string: generateUrlString)
    }
    
    
    
    /// Initializer publico del Single Request
    /// - Parameters:
    ///   - endpoint: La Base del URL a la que vamos a dirigir
    ///   - pathComponents: Los paths que queres agregar para cada api call, por ejemplo. characters, location, episode
    ///   - queryParameters: Los especificos para buscar algun objeto en especifico, por ejemplo ?name=rick&status=alive
    public init(
        endpoint: UCCEndpoint,
                pathComponents: [String] = [],
                queryParameters: [URLQueryItem] = [])
    {
        // Declaramos path y query como empty porque capaz no hayan.
        self.endpoint = endpoint
        self.pathComponents = pathComponents
        self.queryParameters = queryParameters
    }
    
}

extension UCCRequest {
    static let listCharacters = UCCRequest(endpoint: .character)
}
