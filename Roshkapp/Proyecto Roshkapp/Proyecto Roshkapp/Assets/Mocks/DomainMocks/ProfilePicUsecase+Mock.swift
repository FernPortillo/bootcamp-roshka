//
//  ProfilePicUsecase.swift
//  Proyecto Roshkapp
//
//  Created by Bootcamp on 2025-12-12.
//

import Foundation

extension ProfilePicUseCase {
    static func mock() -> ProfilePicUseCase {
        return ProfilePicUseCase(keychain: KeychainManager.shared,
                                 newProfilePictureRepository: ProfilePicRepositoryImplementation.mock())
            
    }
}
