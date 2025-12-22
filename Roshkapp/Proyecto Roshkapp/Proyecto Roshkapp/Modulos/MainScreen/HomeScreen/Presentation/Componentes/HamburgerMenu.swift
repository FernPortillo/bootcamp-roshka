import SwiftUI

struct HamburgerMenu: View {
    // ROUTER
    @Environment(Router.self) private var router
    @Environment(\.appColors) var colors

    
    @EnvironmentObject private var photosVM : ProfilePicViewModel
    @EnvironmentObject private var appState : AppState

    @Binding var viewIndex: String
    @Binding var isShowing: Bool
    var permisosTH: Bool = false
    
    var body: some View {
        ZStack {
            (isShowing ? colors.colorHamburger : Color.clear).edgesIgnoringSafeArea(.all)
            VStack(alignment: .leading)
            {
                HStack{
                    GenerarTopPartHamburger(isShowing: $isShowing)
                }
                .padding(.vertical, Spacing.m)
                .padding(.trailing, Spacing.l)
                
                Divider()
                    .overlay(colors.clearMainColor)
                    .padding(.bottom, Spacing.m)
                    .padding(.trailing, Spacing.m)
                
                ScrollView {
                    GenerarBotonesHamburguesa(viewIndex: $viewIndex, isShowing: $isShowing, permisosTH: permisosTH)
                }
                
                Spacer()
                
                HStack{
                    Image("logout.icon")
                        .resizable()
                        .frame(width: 32, height: 32)
                        .foregroundStyle(colors.deniedBackgroundColor)
                    Text("Cerrar Sesion")
                        .font(.boldMedium)
                        .foregroundStyle(colors.deniedBackgroundColor)
                        .onTapGesture {
                            appState.logout()
                        }
                }
                .padding(.bottom)
            }
            .padding(.leading, Spacing.mm)
            .padding(.top)
            .scaleEffect(isShowing ? 1 : 0)
        }
    }
}

#Preview {
    @Previewable let a = AppState.mockAuthenticated()
    @Previewable let p = ProfilePicViewModel.mock()
    @Previewable let router = Router()
    HamburgerMenu( viewIndex: .constant("Home"), isShowing: .constant(true))
        .environmentObject(p)
        .environmentObject(a)
        .environment(router)
}
