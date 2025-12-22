
import SwiftUI

struct MainScreen: View {
    //Tab bar
    var body: some View {
        HomeScreen()
    }
}

#Preview {
    @Previewable var r = Router()
    let photosVM = ProfilePicViewModel(profilePicUsecase: ProfilePicUseCase.mock())
    let userVM = UserViewModel.mockLoaded()
    let novedadesVM = NovedadesViewModel.mock()
    let appStateMock = AppState.mockAuthenticated()
    let s = SolicitudesViewmodel.mock()
    MainScreen()
        .environmentObject(photosVM)
        .environmentObject(appStateMock)
        .environmentObject(userVM)
        .environmentObject(novedadesVM)
        .environmentObject(s)
        .environment(r)
        .withAppColors()

}
