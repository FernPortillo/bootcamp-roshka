
import SwiftUI

struct SemiCircleTabBar: View {
    @State private var isExpanded: Bool = false
    let onActionSelected: (BotonSolicitudesTabViewEnumTests) -> Void
    var body: some View{
        ZStack{
            let allTabs = BotonSolicitudesTabViewEnumTests.allCases
            ForEach(allTabs.indices, id: \.self) { index in
                let tabView = allTabs[index]
                let angle = angleForTabButton(at: index, total: allTabs.count)
                let radius : CGFloat = 100
                Button {
                    withAnimation {
                        onActionSelected(tabView)
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
                Image(systemName: isExpanded ? "xmark" : "plus")
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

