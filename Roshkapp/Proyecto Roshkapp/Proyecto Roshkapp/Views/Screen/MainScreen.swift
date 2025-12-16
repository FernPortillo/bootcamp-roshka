
import SwiftUI

struct MainScreen: View {
    @StateObject var userVM : UserViewModel
    @StateObject var novedadesVM: NovedadesViewModel
    let appState : AppState
    
    //Tab bar
    @State var isButtonOpen: Bool = false
    var body: some View {
            TabView{
                Tab("Home", systemImage: "house")
                {
                    HomeScreen(userVM: userVM, novedadesVM: novedadesVM)
                }

                Tab("Ver Mas", systemImage: "ellipsis")
                {
                    Text("Ver mas")
                }
            }
    }
}




#Preview {
    @Previewable let photosVM = ProfilePicViewModel(profilePicUsecase: ProfilePicUseCase.mock())
    let userVM = UserViewModel.mockLoaded()
    let novedadesVM = NovedadesViewModel.mock()
    let appStateMock = AppState.mockAuthenticated()
    MainScreen(userVM: userVM, novedadesVM: novedadesVM, appState: appStateMock)
        .environmentObject(photosVM)
}
