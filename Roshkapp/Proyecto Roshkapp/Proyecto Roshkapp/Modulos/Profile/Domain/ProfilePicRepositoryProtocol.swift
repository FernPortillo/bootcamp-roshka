//
//  ProfilePicRepositoryProtocol.swift
//  Proyecto Roshkapp
//
//  Created by Bootcamp on 2025-12-20.
//



protocol ProfilePicRepositoryProtocol {
    func uploadNewProfilePic(token: String, body : PhotoUpdateModel) async throws -> PostResponse
}
