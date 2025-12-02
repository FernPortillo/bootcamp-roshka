//
//  UCCService.swift
//  UIKitCrashCourse
//
//  Created by Bootcamp on 2025-11-28.
//

import Foundation

/// Servicio primario de la API que realiza el GET a la api de Rick y morty
final class UCCService
{
    /// Instancia unica del singleton del servicio
    static let shared = UCCService()
    
    // al privatizar el init, obligas a usar el shared, como singleton
    
    /// Constructor privado
    private init() {}
    
    enum UCCServiceError: Error {
        case failedToCreateRequest
        case failedToGetData
        case failedToSerializeData
    }
    
    /// Envia un call a la API de Rick y Morty
    /// - Parameters:
    ///   - request: request instance
    ///   - type: tipo de objeto que esperamos
    ///   - completion: el callback que recibis, con el error o el success
    public func execute<T: Codable & Sendable>(
        _ request: UCCRequest,
        expecting type: T.Type,
        completion: @escaping (Result<T, Error>) -> Void)
    {
        guard let urlRequest = self.request(from: request) else {
            completion(.failure(UCCServiceError.failedToCreateRequest))
            return
        }
        
        let expectedType = type

        let task = URLSession.shared.dataTask(with: urlRequest) { data, _, error in
            guard let data = data, error == nil else {
                completion(.failure(UCCServiceError.failedToGetData))
                return
            }
            
            do {
                let result = try JSONDecoder().decode(expectedType, from: data)
                completion(.success(result))
            } catch {
                completion(.failure(UCCServiceError.failedToSerializeData))
            }
        }
        
        task.resume()
    }

    
    // MARK: -  PRIVATE
    private func request(from uccRequest: UCCRequest) -> URLRequest?
    {
        guard let url = uccRequest.url else {return nil}
        var request = URLRequest(url: url)
        
        request.httpMethod = uccRequest.httpMethod
        
        return request
    }
}
