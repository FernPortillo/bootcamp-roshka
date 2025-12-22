final class RepositoryFactory {
    // MARK: - Services
    let appService: AppService
    let keychainManager: KeychainManager
    let userPrefs: UserPreferences
    
    // MARK: - Repositories
    let authRepository: AuthRepositoryImplementation
    let userRepository: UserRepositoryImplementation
    let novedadesRepository: NovedadesRepositoryImplementation
    let solicitudesRepository: SolicitudesRepositoryImplementation
    let photosRepository: ProfilePicRepositoryImplementation
    
    // MARK: - Usecases
    let loginUsecase: LoginUsecase
    
    init() {
        // Servicios
        self.appService = AppService()
        self.keychainManager = KeychainManager.shared
        self.userPrefs = UserPreferences.shared
        
        // Repositories
        self.authRepository = AuthRepositoryImplementation(appService: appService)
        self.userRepository = UserRepositoryImplementation(appService: appService)
        self.novedadesRepository = NovedadesRepositoryImplementation(appService: appService)
        self.solicitudesRepository = SolicitudesRepositoryImplementation(appService: appService)
        self.photosRepository = ProfilePicRepositoryImplementation(appService: appService)
        
        // Usecases
        self.loginUsecase = LoginUsecase(keychain: keychainManager, authRepository: authRepository)
    }
}
