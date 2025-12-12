
import SwiftUI

struct MainScreen: View {
    @StateObject var userVM : UserViewModel
    @StateObject var novedadesVM: NovedadesViewModel
    let appState : AppState
    
    var body: some View {
        TabView {
            Tab("Home", systemImage: "house")
            {
                HomeScreen(userVM: userVM, novedadesVM: novedadesVM)
            }

            Tab("Ver más", systemImage: "ellipsis")
            {
            }
        }
    }
}




//#Preview {
//    @Previewable let photosVM = PhotoViewModel()
//    let userVM = UserViewModel.mockLoaded()
//    let novedadesVM = NovedadesViewModel.mock()
//    let appStateMock = AppState.mockAuthenticated()
//    MainScreen(userVM: userVM, novedadesVM: novedadesVM, appState: appStateMock)
//        .environmentObject(photosVM)
//}
