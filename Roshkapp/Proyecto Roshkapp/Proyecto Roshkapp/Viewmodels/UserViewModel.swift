//
//  UserViewModel.swift
//  Proyecto Roshkapp
//
//  Created by Bootcamp on 2025-12-04.
//

import Foundation
import Combine

final class UserViewModel: ObservableObject
{
    private let userUC : UserUsecase
    @Published var state : LoadingState<UserModel> = .idle
    
    init(userUC: UserUsecase) {
        self.userUC = userUC
    }
    
    @MainActor
    func getUser() async {
        state = .loading
        do{
            let user = try await userUC.getMyUser()
            state = .loaded(user)
        }
        catch{
            state = .failed(error)
        }
    }
}


enum LoadingState<T>
{
    case idle
    case loading
    case loaded(T)
    case failed(Error)
}
