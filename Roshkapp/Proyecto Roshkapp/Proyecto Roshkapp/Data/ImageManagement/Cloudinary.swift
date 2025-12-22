import Foundation
import Cloudinary
import SwiftUI

final class CloudinaryManager {

    static let shared = CloudinaryManager()
    let cloudinary: CLDCloudinary

    private init() {
        let config = CLDConfiguration(
            cloudName: CloudinaryAppConfig.cloudinaryCloudName
        )
        self.cloudinary = CLDCloudinary(configuration: config)
    }

    func uploadProfileImage(
        _ image: UIImage
    ) async throws -> String {

        try await withCheckedThrowingContinuation { continuation in
            cloudinary.createUploader().upload(
                data: image.jpegData(compressionQuality: 0.8)!,
                uploadPreset: CloudinaryAppConfig.cloudinaryUploadPreset,
                completionHandler: { result, error in
                    if let error = error {
                        continuation.resume(throwing: error)
                    } else if let url = result?.secureUrl {
                        continuation.resume(returning: url)
                    }
                }
            )
        }
    }
}

enum CloudinaryAppConfig {
    static let apiBaseUrl = "https://TU-DOMINIO-O-EC2/api"
    static let cloudinaryCloudName = "dcjadfldc"
    static let cloudinaryUploadPreset = "portalroshka"
}
