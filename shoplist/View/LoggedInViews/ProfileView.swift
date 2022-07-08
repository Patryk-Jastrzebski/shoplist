import SwiftUI
import Firebase

struct ProfileView: View {
    
    @EnvironmentObject private var viewModel: ListViewModel
    
    var body: some View {
        Form {
            Section(header: Text("Profile")) {
                VStack {
                    HStack {
                        Image(systemName: "person.circle")
                            .padding()
                            .font(.largeTitle)
                            .background(
                                Circle()
                                    .fill(.white)
                            )
                        Text("Email: \((Auth.auth().currentUser?.email)!)")
                    }
                }
            }
            Section(header: Text("Connect user")) {
                Button(action: {
                    
                }, label: {
                    Text("Add new")
                })
            }
            Section(header: Text("Accounts connected"),
                    footer: Text("All accounts connected to list from this account - they can modify all data! Be careful!")
            ) {
                Text("name@eu.pl")
                Text("name2@eu.pl")
            }
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
