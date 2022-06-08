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
    var body: some View {
        Button("Logout") {
            try? Auth.auth().signOut()
            logStatus = false
        }
        if useFaceID {
            Button("Disable Face ID") {
                useFaceID = false
                faceIDEmail = ""
                faceIDPassword = ""
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
