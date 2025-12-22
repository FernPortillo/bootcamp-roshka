//
//  UserDefaults.swift
//  Proyecto Roshkapp
//
//  Created by Bootcamp on 2025-12-16.
//

import Foundation
import Combine

class UserPreferences : ObservableObject {
    
    static let shared = UserPreferences()
    
    ///Inicializacion
    private let defaults = UserDefaults.standard
    
    /// Keys
    private enum Key: String{
        case savedEmail = "user_saved_email"
        case lastUserId = "last_user_id"
        case rememberMe = "remember_me"
    }
    
    
    /// DidSet para poder observar los cambios automaticamente y guardarlos
    @Published var savedEmail: String{
        didSet{
            defaults.set(savedEmail, forKey: Key.savedEmail.rawValue)
        }
    }
    @Published var rememberMe: Bool {
        didSet {
            defaults.set(rememberMe, forKey: Key.rememberMe.rawValue)
        }
    }
    
    /// Nilable porque puede estar vacia ?)
    var lastUserId: Int? {
        get{
            let id = defaults.integer(forKey: Key.lastUserId.rawValue)
            return id == 0 ? nil : id
        }
        set{ // Si no es nil
            if let value = newValue{
                defaults.set(value, forKey: Key.lastUserId.rawValue)
            }
            else{
                defaults.removeObject(forKey: Key.lastUserId.rawValue)
            }
        }
    }
    
    init() {
        self.savedEmail = defaults.string(forKey: Key.savedEmail.rawValue) ?? ""
        self.rememberMe = defaults.bool(forKey: Key.rememberMe.rawValue)
    }
    
    func clearAll()
    {
        savedEmail = ""
        rememberMe = false
        lastUserId = nil
    }
    
}
