//
//  NewProfilePictureReposirtory.swift
//  Proyecto Roshkapp
//
//  Created by Bootcamp on 2025-12-11.
//
import Foundation


protocol ProfilePicRepositoryProtocol {
    func uploadNewProfilePic(token: String, body : PhotoUpdateModel) async throws -> PostResponse
}

struct ProfilePicRepositoryImplementation : ProfilePicRepositoryProtocol {
    let appService : AppService
    func uploadNewProfilePic(token: String, body: PhotoUpdateModel) async throws -> PostResponse {
        // print("getting user")
        return try await appService.execute(from: Endpoints.updateProfilePic.rawValue,
                                            method: .POST,
                                            type: PostResponse.self,
                                            token: token,
                                            body: body)
    }
}

