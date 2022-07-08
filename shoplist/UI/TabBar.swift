import SwiftUI
import Firebase

struct TabBar: View {
    @Binding var selectedTab: String
    @State var tabPoints : [CGFloat] = []
    
    var body: some View {
        HStack(spacing: 0) {
            TabBarButton(image: "person",selectedTab: $selectedTab, tabPoints: $tabPoints)
            TabBarButton(image: "house",selectedTab: $selectedTab, tabPoints: $tabPoints)
            TabBarButton(image: "gearshape",selectedTab: $selectedTab, tabPoints: $tabPoints)
        }
        .padding()
        .background(Color("yellow").clipShape(TabCurve(tabPoint: getCurvePoint() - 15)))
        .cornerRadius(15)
        .padding(.horizontal)
    }
    func getCurvePoint() ->CGFloat {
        if tabPoints.isEmpty {
            return 10
        } else {
            switch selectedTab {
            case "person":
                return tabPoints[0]
            case "house":
                return tabPoints[1]
            default:
                return tabPoints[2]
            }
        }
    }
}

struct TabBar_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}

struct TabBarButton: View {
    var image: String
    @Binding var selectedTab: String
    @Binding var tabPoints: [CGFloat]
    var body: some View {
        GeometryReader{reader -> AnyView in
            let midX = reader.frame(in: .global).midX
            DispatchQueue.main.async {
                if tabPoints.count <= 2 {
                    tabPoints.append(midX)
                    print(midX)
                }
                tabPoints.sort()
            }
            return AnyView (
            Button(action: {
                withAnimation(.interactiveSpring(response: 0.6, dampingFraction: 0.5, blendDuration: 0.5)) {
                    selectedTab = image
                }
            }, label: {
                Image(systemName: "\(image)\(selectedTab == image ? ".fill" : "")")
                    .font(.system(size: 20, weight: .semibold))
                    .foregroundColor(Color.black)
                    .offset(y: selectedTab == image ? -10 : 0)
            })
                .frame(maxWidth: .infinity, maxHeight: .infinity)
        )
        }.frame(height: 30)
            
    }
}
