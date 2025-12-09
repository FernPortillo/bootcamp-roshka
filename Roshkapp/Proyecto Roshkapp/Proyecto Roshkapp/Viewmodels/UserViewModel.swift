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
            let user = try await userUC.getUser()
            print(user.rol.idRol)
            state = .loaded(user)
        }
        catch{
            state = .failed(error)
        }
    }
}




