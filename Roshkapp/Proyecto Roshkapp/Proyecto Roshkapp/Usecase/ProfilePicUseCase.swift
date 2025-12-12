//
//  UploadNewProfilePictureUsecase.swift
//  Proyecto Roshkapp
//
//  Created by Bootcamp on 2025-12-11.
//

import Foundation

final class ProfilePicUseCase : AuthenticatedUsecase
{
    let keychain : KeychainManager
    let appState : AppState
    let newProfilePictureRepository : ProfilePicRepositoryImplementation
    
    init(keychain: KeychainManager, appState: AppState, newProfilePictureRepository: ProfilePicRepositoryImplementation) {
        self.keychain = keychain
        self.appState = appState
        self.newProfilePictureRepository = newProfilePictureRepository
    }
    

    func updateProfilePicture(newPic: String) async throws -> PostResponse {

        guard let token = try? keychain.getAccessToken(), !token.isEmpty else {
            print("Token no disponible")
            throw ApiError.unknownError
        }
        
        //print("Token disponible: \(String(token.prefix(20)))...")
        //print("Tamaño del base64: \(newPic.count) caracteres")
        
        let body = PhotoUpdateModel(foto: newPic)
        
        return try await executeWithToken { token in
            try await newProfilePictureRepository.uploadNewProfilePic(token: token, body: body)
        }
    }
}

