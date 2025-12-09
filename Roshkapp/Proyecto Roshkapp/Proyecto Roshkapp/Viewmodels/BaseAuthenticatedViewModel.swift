//
//  BaseAuthenticatedViewModel.swift
//  Proyecto Roshkapp
//
//  Created by Bootcamp on 2025-12-05.
//

import Foundation

protocol BaseAuthenticatedViewModel: ObservableObject {
    var isLoading: Bool { get set }
    var errorMessage: String? { get set }
}

extension BaseAuthenticatedViewModel {
    @MainActor
    func executeAsync<T>(
        // La anotacion escaping permite que recibamos el objeto DESPUES de que se ejecuten las asyncs, no antes
        _ operation : @escaping () async throws  -> T,
        onSuccess: @escaping (T) -> Void)
    async {
            isLoading = true
            errorMessage = nil
        do {
            let result = try await operation()
            onSuccess(result)
        }
        
        catch
        {
            errorMessage = error.localizedDescription
            print("Error: \(error)")
        }
        
        isLoading = false
    }
}
