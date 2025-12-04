//
//  KeychainManager.swift
//  Proyecto Roshkapp
//
//  Created by Bootcamp on 2025-12-04.
//

import KeychainAccess
import Foundation
import Combine

class KeychainManager : ObservableObject {
    
    static let shared = KeychainManager()
    
    private let keychain : Keychain
    
    init() {
        self.keychain = Keychain(service: "com.Roshkapp.auth.service")
    }
    
    private enum KeychainKey : String {
        case accessToken = "bearer_token_access"
        case credentials = "user_credentials"
    }
    
    // Getter y setter de los access tokens
    
    func saveAccessToken(_ token: String) throws {
        try keychain.set(token, key: KeychainKey.accessToken.rawValue)
    }
    
    func getAccessToken() throws -> String?{
        return try? keychain.get(KeychainKey.accessToken.rawValue)
    }
    
    func clearAll() {
        try? keychain.remove(KeychainKey.accessToken.rawValue)
    }
}
