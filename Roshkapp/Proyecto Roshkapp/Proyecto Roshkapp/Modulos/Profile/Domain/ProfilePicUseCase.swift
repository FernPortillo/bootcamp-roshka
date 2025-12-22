//
//  UploadNewProfilePictureUsecase.swift
//  Proyecto Roshkapp
//
//  Created by Bootcamp on 2025-12-11.
//

import Foundation
import SwiftUI

final class ProfilePicUseCase : AuthenticatedUsecase
{
    let keychain : KeychainManager
    let newProfilePictureRepository : ProfilePicRepositoryImplementation
    
    init(keychain: KeychainManager, newProfilePictureRepository: ProfilePicRepositoryImplementation) {
        self.keychain = keychain
        self.newProfilePictureRepository = newProfilePictureRepository
    }
    

    func updateProfilePicture(newPic: String) async throws -> PostResponse {

        guard let token = try? keychain.getAccessToken(), !token.isEmpty else {
            print("Token no disponible")
            throw ApiError.unknownError
        }
        
        //print("Token disponible: \(String(token.prefix(20)))...")
        //print("Tamaño del base64: \(newPic.count) caracteres")
        
        let body = PhotoUpdateModel(urlPerfil: newPic)
        print("Enviando foto a la base de datos \(newPic)")
        
        return try await executeWithToken { token in
            try await newProfilePictureRepository.uploadNewProfilePic(token: token, body: body)
        }
    }
    
}

