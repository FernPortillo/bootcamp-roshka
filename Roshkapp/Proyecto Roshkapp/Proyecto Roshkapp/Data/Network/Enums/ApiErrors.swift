//
//  ApiErrors.swift
//  Proyecto Roshkapp
//
//  Created by Bootcamp on 2025-12-03.
//

import Foundation

enum ApiError : LocalizedError {
    case invalidURL
    case invalidResponse(statusCode: Int)
    case unknownError
    case httpError(Error)
    case decoding(Error)
    
    
    var errorDescription: String? {
        switch self {
        case .invalidURL:
            return "Invalid URL"
        case .invalidResponse(let statusCode):
            return "Invalid response from server. HTTP status code: \(statusCode)"
        case .unknownError:
            return "Error desconocido"
        case .httpError(let error):
            return "HTTP Error \(error)"
        case .decoding(let error):
            return "Failed to decode \(error.localizedDescription)"
        }
    }
    var isCancellation: Bool {
        if case .httpError(let underlyingError) = self {
            if let nsError = underlyingError as? NSError,
               nsError.domain == NSURLErrorDomain,
               nsError.code == NSURLErrorCancelled {
                return true
            }
        }
        return false
    }
    
}


