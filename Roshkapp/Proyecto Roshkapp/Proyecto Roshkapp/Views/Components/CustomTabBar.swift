
import SwiftUI

struct TabItem {
    let name: String
    let systemImage: String
}

enum TabViewEnum: Identifiable, CaseIterable, View {
    case vacaciones, beneficios, permisos, dispositivos
    var id: Self { self }
    
    var tabItem: TabItem {
        switch self {
            case .vacaciones:
                    .init(name: "Vacaciones", systemImage: "beach.umbrella.fill")
            case .beneficios:
                    .init(name: "Beneficios", systemImage: "gift")
            case .permisos:
                    .init(name: "Permisos", systemImage: "calendar.badge.exclamationmark")
            case .dispositivos:
                    .init(name: "Dispositivos", systemImage: "laptopcomputer")
        }
    }
    
    var body: some View {
        switch self {
            case .vacaciones:
                Text("Home")
            case .beneficios:
                Text("Home")
            case .dispositivos:
                Text("Home")
            case .permisos:
                Text("Home")

        }
    }
}

struct SemiCircleTabBar: View {
    @Binding var selectedTab: TabViewEnum
    @State private var isExpanded: Bool = false
    var body: some View{
        ZStack{
            let allTabs = TabViewEnum.allCases
            ForEach(allTabs.indices, id: \.self) { index in
                let tabView = allTabs[index]
                let angle = angleForTabButton(at: index, total: allTabs.count)
                let radius : CGFloat = 100
                Button {
                    withAnimation {
                        selectedTab = tabView
                        isExpanded.toggle()
                    }
                } label: {
                    Image(systemName: tabView.tabItem.systemImage)
                        .font(.system(size: Spacing.mm))
                        .bold()
                        .padding()
                        .frame(width: 50)
                        .foregroundStyle(Color.white)
                        .background(Color.accentColor, in: Circle())
                }
                .disabled(tabView == selectedTab)
                .offset(
                    x: isExpanded ? radius * cos(angle.radians) : 0,
                    y: isExpanded ? radius * sin(angle.radians) : 0
                )
                .animation(.spring(), value: isExpanded)
            }
            Button {
                withAnimation {
                    isExpanded.toggle()
                }
            } label: {
                Image(systemName: "plus")
                    .font(.system(size: Spacing.mm))
                    .bold()
                    .padding()
                    .frame(width: 75)
                    .foregroundStyle(Color.white)
                    .background(Color.accentColor, in: Circle())
            }
            .shadow(color: .black.opacity(0.25), radius: 5, x: 0, y: 5)
        }
    }
    private func angleForTabButton(at index: Int, total: Int) -> Angle {
            guard total > 1 else {
                return .degrees(-90)
            }
            let totalArc: Double = 180
            let degreesPerItem = totalArc / Double(total - 1)
            let startAngle: Double = -180
            
            let degrees = startAngle + (Double(index) * degreesPerItem)
            return .degrees(degrees)
        }
}

#Preview {
    @Previewable @State var selectedTab = TabViewEnum.vacaciones
    SemiCircleTabBar(selectedTab: $selectedTab)
}
