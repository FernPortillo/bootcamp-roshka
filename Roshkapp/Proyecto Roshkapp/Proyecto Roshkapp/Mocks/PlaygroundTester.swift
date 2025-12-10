//
//  PlaygroundTester.swift
//  Proyecto Roshkapp
//
//  Created by Bootcamp on 2025-12-10.
//


import Playgrounds
import Foundation

/// Mock para probar API calls simples, para ver si recibo bien los datos
/// Cambiar el token la url y el dato recibido para probar
#Playground
{
    let token = "eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ0aEB0aC5jb20iLCJyb2wiOjEsImV4cCI6MTc2NTM3MzM4NywiaWF0IjoxNzY1MzY2MTg3fQ.sL51SkvissBKhx--IJpCcyojK00cSHR1CYKotsAVyC4"
    
    guard let url = URL(string: "http://localhost:8080/api/v1/admin/th/novedades") else {
        print("URL Invalida")
        return
    }
    var request = URLRequest(url: url)
    request.httpMethod = "GET"
    request.setValue("Bearer \(token)", forHTTPHeaderField: "Authorization")
    
    Task {
        do {
            let (data, _) = try await URLSession.shared.data(for: request)
            let response = try JSONDecoder().decode([NovedadesModel].self, from: data)
        } catch {
            print(error)
        }
    }
}
