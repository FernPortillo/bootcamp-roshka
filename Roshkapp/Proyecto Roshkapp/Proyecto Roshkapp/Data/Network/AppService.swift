//
//  AppService.swift
//  Proyecto Roshkapp
//
//  Created by Bootcamp on 2025-12-03.
//

import Foundation




final class AppService
{
    
    //MARK: Cambiar que la URL sea de donde se envie
    func execute<T: Decodable>(from URLString: String,
                               method: MethodType,
                               type: T.Type,
                               token: String? = nil,
                               body: Encodable? = nil,) async throws -> T
    {
        
        guard let url = URL(string: URLString) else {
            throw ApiError.invalidURL
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = method.rawValue
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        // Si es un request after-login, tiene que enviar el token
        if token != nil
        {
            request.setValue("Bearer \(token!)", forHTTPHeaderField: "Authorization")
        }
        
        
        
        if let body = body{
            request.httpBody = try JSONEncoder().encode(body)
        }
        do {
            let (data, response) = try await URLSession.shared.data(for: request)
            
            guard let httpResponse = response as? HTTPURLResponse,
                  (200...299).contains(httpResponse.statusCode) else {
                throw ApiError.invalidResponse
            }
            
            return try JSONDecoder().decode(type, from: data)
        } catch let error as DecodingError {
            throw ApiError.decoding(error)
        } catch let error as URLError {
            throw ApiError.httpError(error)
        }
        
    }
}



