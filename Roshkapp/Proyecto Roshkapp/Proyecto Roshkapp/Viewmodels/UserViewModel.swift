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
            print("\(user.nombre) is \(user.rol.nombre)")
            state = .loaded(user)
        }
        catch{
            state = .failed(error)
        }
    }
    
    @MainActor
    func getUserById(idUser: Int) async -> UserModel?{
        do{
            let user = try await userUC.getUser()
            print("\(user.nombre) is \(user.rol.nombre)")
            return user
        }
        catch{
            state = .failed(error)
        }
        return nil
    }
    
    func checkUserIsMyUser(user: UserModel) -> Bool{
        let isMyUser = userUC.checkUserisMyUser(user: user)
        print("\(isMyUser) es mi usuario")
        return isMyUser
    }
}




