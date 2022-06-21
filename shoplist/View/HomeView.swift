
import SwiftUI
import Firebase

struct HomeView: View {
    @AppStorage("log_status") var logStatus: Bool = false
    @AppStorage("use_face_id") var useFaceID: Bool = false
    @AppStorage("use_face_email") var faceIDEmail: String = ""
    @AppStorage("use_face_password") var faceIDPassword: String = ""
    
    @State private var title = ""
    @State var selectedTab = "house"
    @State private var productName = ""
    @State private var addView: Bool = false
    
    @StateObject private var viewModel = ListViewModel()
    
    var body: some View {
        ZStack {
            VStack {
                AppNavBarView(title: title, page: selectedTab, button: AnyView(addButton))
                if selectedTab == "house" {
                    Spacer()
                    ListView()
                        .onAppear {title = "Shop list"}
                }
                else if selectedTab == "person" {
                    ProfileView()
                        .padding(.top, -23)
                        .onAppear {title = "Profile"}
                }
                else if selectedTab == "gearshape" {
                    SettingsView()
                        .padding(.top, -23)
                        .onAppear {title = "Settings"}
                    
                }
            }
            VStack {
                Spacer()
                TabBar(selectedTab: $selectedTab)
            }
        }.sheet(isPresented: $addView, content: {AddProductView()})
        
    }
    private var addButton: some View {
        Button(action: {addView.toggle()}, label: {
            ZStack {
                Circle()
                    .fill(.black)
                    .frame(width: 30, height: 30)
                Image(systemName: "plus")
                    .font(.title3)
                    .foregroundColor(.white)
            }.padding()})
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
