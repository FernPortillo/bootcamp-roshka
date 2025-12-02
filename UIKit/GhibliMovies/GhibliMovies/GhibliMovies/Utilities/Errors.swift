//
//  Errors.swift
//  GhibliMovies
//
//  Created by Bootcamp on 2025-11-30.
//

import Foundation

enum APIError : LocalizedError {
    case invalidURL
    case invalidResponse
    case decodingError(Error)
    case networkError(Error)
    
    var errorDescription: String?{
        switch self{
        case .invalidURL:
            return "La URL es invalida"
        case .decodingError(let error):
            return "Error, no se pudo decodear la respuesta: \(error.localizedDescription)"
        case .invalidResponse:
            return "La respuesta del servidor es invalida"
        case .networkError(let error):
            return "Error de network: \(error.localizedDescription)"
        }
    }
}
