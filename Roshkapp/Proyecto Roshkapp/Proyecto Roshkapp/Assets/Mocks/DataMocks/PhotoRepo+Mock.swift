//
//  PhotoRepo+Mock.swift
//  Proyecto Roshkapp
//
//  Created by Bootcamp on 2025-12-12.
//

extension ProfilePicRepositoryImplementation {
    static func mock() -> ProfilePicRepositoryImplementation {
        return ProfilePicRepositoryImplementation(appService: AppService())
    }
}
