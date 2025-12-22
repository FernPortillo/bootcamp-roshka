//
//  PostResponse.swift
//  Proyecto Roshkapp
//
//  Created by Bootcamp on 2025-12-11.
//
struct PostResponse: Decodable {
    let message: String
    
    // JSON
    init(message: String) {
        self.message = message
    }
    
    // No JSON
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.message = try container.decode(String.self, forKey: .message)
    }
    
    enum CodingKeys: String, CodingKey {
        case message
    }
}

