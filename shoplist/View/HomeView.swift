
import SwiftUI
import Firebase

struct HomeView: View {
    @AppStorage("log_status") var logStatus: Bool = false
    @AppStorage("use_face_id") var useFaceID: Bool = false
    @AppStorage("use_face_email") var faceIDEmail: String = ""
    @AppStorage("use_face_password") var faceIDPassword: String = ""
    
    @State private var title = ""
    @State private var productName = ""
    @State private var addView: Bool = false
    
    @StateObject private var viewModel = ListViewModel()
    
    var body: some View {
        NavigationView {
            ZStack {
                ListView()
                VStack {
                    Spacer()
                    HStack {
                        Spacer()
                        addButton
                            .padding(.trailing, 30)
                    }
                }
            }
        }
        .sheet(isPresented: $addView, content: {AddProductView()})
        
    }
    private var addButton: some View {
        Button(action: {addView.toggle()}, label: {
            ZStack {
                Circle()
                    .fill(.blue)
                    .frame(width: 50, height: 50)
                    .shadow(color: .blue, radius: 3, x: 1, y: 1)
                Image(systemName: "plus")
                    .font(.title3)
                    .foregroundColor(.white)
            }.padding()})
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView().environmentObject(ListViewModel())
    }
}
