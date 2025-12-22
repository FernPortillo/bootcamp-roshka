//
//  ProfilePicVM+Mock.swift
//  Proyecto Roshkapp
//
//  Created by Bootcamp on 2025-12-12.
//

import Foundation

extension ProfilePicViewModel {
    static func mock() -> ProfilePicViewModel {
        return ProfilePicViewModel(profilePicUsecase: ProfilePicUseCase.mock())
    }
}
