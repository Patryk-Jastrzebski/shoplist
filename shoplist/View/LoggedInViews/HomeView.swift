//
//  HomeView.swift
//  shoplist
//
//  Created by Patryk Jastrzębski on 08/06/2022.
//

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
    
    @StateObject private var viewModel = ListViewModel()
    
    var body: some View {
        ZStack {
            VStack {
                AppNavBarView(title: title)
                Spacer()
                if selectedTab == "house" {
                    ListView()
                        .task {title = "List."}
                    
                }
                else if selectedTab == "person" {
                    Text("Profil")
                        .task {title = "Profile."}
                }
                else if selectedTab == "gearshape" {
                    SettingsView()
                        .task {title = "Settings."}
                }
            }
            
            
            VStack {
                Spacer()
                TabBar(selectedTab: $selectedTab)
            }
        }
        
        //        VStack {
        //            Button("Logout") {
        //                try? Auth.auth().signOut()
        //                logStatus = false
        //            }
        //            if useFaceID {
        //                Button("Disable Face ID") {
        //                    useFaceID = false
        //                    faceIDEmail = ""
        //                    faceIDPassword = ""
        //                }
        //            }
        //       }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
