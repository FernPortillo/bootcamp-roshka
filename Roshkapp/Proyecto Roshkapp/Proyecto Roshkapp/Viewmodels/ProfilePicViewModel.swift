//
//  PhotoViewModel.swift
//  Proyecto Roshkapp
//
//  Created by Bootcamp on 2025-12-11.
//

import SwiftUI
import PhotosUI
import Combine


final class ProfilePicViewModel: ObservableObject
{
    @Published var photoPickerItem: PhotosPickerItem?
    {
        didSet { loadImageFromGallery() }
    }
    @Published var imageB64 : String?
    private let profilePicUsecase : ProfilePicUseCase
    
    init(photoPickerItem: PhotosPickerItem? = nil, imageB64: String? = nil, profilePicUsecase: ProfilePicUseCase) {
        self.photoPickerItem = photoPickerItem
        self.imageB64 = imageB64
        self.profilePicUsecase = profilePicUsecase
    }
    
    private func loadImageFromGallery() {
        Task {
            guard let data = try? await photoPickerItem?.loadTransferable(type: Data.self),
                  let uiImage = UIImage(data: data) else { return }
            
            let newB64Image = convertToBase64(image: uiImage)
            await MainActor.run {
                self.imageB64 = newB64Image
            }
            
            do {
                let response = try await profilePicUsecase.updateProfilePicture(newPic: newB64Image!)
                print("Éxito: \(response)")

            } catch {
                print("Error 401: Verifica el token y el formato de la imagen")
                print("Detalles: \(error)")
                
            }
        }
        
    }
    
    func base64ToImage(_ base64String: String) -> Image? {
        let cleanBase64 = base64String
            .replacingOccurrences(of: "data:image/png;base64,", with: "")
            .replacingOccurrences(of: "data:image/jpeg;base64,", with: "")
            .replacingOccurrences(of: "data:image/jpg;base64,", with: "")
        guard let imageData = Data(base64Encoded: cleanBase64) else {
            return nil
        }
        guard let uiImage = UIImage(data: imageData) else {
            return nil
        }
        
        return Image(uiImage: uiImage)
    }
    
    func convertToBase64(image: UIImage) -> String? {
        guard let imageData = image.jpegData(compressionQuality: 0.3) else { return nil }
        return imageData.base64EncodedString()
    }
    
    func checkIfMyUser(user: UserModel) -> Bool{
        return profilePicUsecase.isMyUser(user: user)
    }
    
}
