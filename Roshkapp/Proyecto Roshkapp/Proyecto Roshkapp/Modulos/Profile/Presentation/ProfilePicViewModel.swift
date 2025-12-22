import SwiftUI
import PhotosUI
import Combine
import Kingfisher

final class ProfilePicViewModel: ObservableObject {
    @Published var photoPickerItem: PhotosPickerItem? {
        didSet { loadImageFromGallery() }
    }
    @Published var localPreviewImage: UIImage?
    @Published var isUploading = false
    
    var onUploadSuccess: ((String) -> Void)?
    var onDeleteSuccess: (() -> Void)?
    
    private let profilePicUsecase: ProfilePicUseCase
    private let cloudinary = CloudinaryManager.shared
    
    var appState: AppState?

    init(profilePicUsecase: ProfilePicUseCase) {
        self.profilePicUsecase = profilePicUsecase
    }

    private func loadImageFromGallery() {
        Task {
            do {
                guard let data = try await photoPickerItem?.loadTransferable(type: Data.self),
                      let uiImage = UIImage(data: data) else { return }

                await MainActor.run {
                    self.localPreviewImage = uiImage
                    self.isUploading = true
                }
                let newURL = try await cloudinary.uploadProfileImage(uiImage)
                
                _ = try await profilePicUsecase.updateProfilePicture(newPic: newURL)

                await MainActor.run {
                    self.appState?.myUser.urlPerfil = newURL
                    
                    self.localPreviewImage = nil
                    self.isUploading = false
                    
                    onUploadSuccess?(newURL)
                }
            } catch {
                await MainActor.run { self.isUploading = false }
            }
        }
    }
    
    func deleteProfilePic(currentUrl: String?)
    {
        guard !isUploading else { return }
        
        Task {
            do{
                await MainActor.run { self.isUploading = true }
                _ = try await profilePicUsecase.updateProfilePicture(newPic: "")
                
                if let urlString = currentUrl, let url = URL(string: urlString){
                    try? await ImageCache.default.removeImage(forKey: url.absoluteString)
                }
                
                await MainActor.run {
                    self.localPreviewImage = nil
                    self.isUploading = false
                    
                    onDeleteSuccess?()
                }
            }
            catch
            {
                await MainActor.run {
                    self.isUploading = false
                    print("Error al subir la foto")
                }
            }
        }
    }
}
