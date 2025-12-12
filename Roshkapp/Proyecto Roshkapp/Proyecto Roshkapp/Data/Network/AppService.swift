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
            // print("Tiene token")
            request.setValue("Bearer \(token!)", forHTTPHeaderField: "Authorization")
        }
        
        
        
        if let body = body{
            let jsonData = try JSONEncoder().encode(body)
            request.httpBody = jsonData
//            if let jsonString = String(data: jsonData, encoding: .utf8) {
//                print("Body enviado (primeros 500 chars): \(String(jsonString.prefix(500)))")
//            }
        }
        
        
        
        do {
            let (data, response) = try await URLSession.shared.data(for: request)
            
            guard let httpResponse = response as? HTTPURLResponse else {
                throw ApiError.invalidResponse(statusCode: -1)
            }
            
            
            print("Status Code: \(httpResponse.statusCode)")

            guard (200...299).contains(httpResponse.statusCode) else {
                throw ApiError.invalidResponse(statusCode: httpResponse.statusCode)
            }
            
            
            if T.self == PostResponse.self {
                if let responseString = String(data: data, encoding: .utf8),
                    !responseString.isEmpty,
                    !responseString.starts(with: "{") { // No es JSON
                    let postResponse = PostResponse(message: responseString)
                    return postResponse as! T
                }
            }
            
            return try JSONDecoder().decode(type, from: data)
        } catch let error as DecodingError {
            throw ApiError.decoding(error)
        } catch let error as URLError {
            throw ApiError.httpError(error)
        }
        
    }
    
}



