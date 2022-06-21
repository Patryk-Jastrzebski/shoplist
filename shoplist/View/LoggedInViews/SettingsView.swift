//
//  SettingsView.swift
//  shoplist
//
//  Created by Patryk Jastrzębski on 17/06/2022.
//

import SwiftUI
import Firebase

struct SettingsView: View {
    
    @AppStorage("log_status") var logStatus: Bool = false
    @AppStorage("use_face_id") var useFaceID: Bool = false
    @AppStorage("use_face_email") var faceIDEmail: String = ""
    @AppStorage("use_face_password") var faceIDPassword: String = ""
    
    var body: some View {
        VStack{
            Form{
                Section(header: Text("Display"),
                        footer: Text("System settings will override DarkMode and use the current device theme")
                ) {
                    Toggle(isOn: .constant(true),
                           label: {
                        Text("Dark mode")
                    })
                    Toggle(isOn: .constant(true),
                           label:{
                        Text("Use system settings")
                    }
                    )
                }
                Section(header: Text("Infomations"),
                        footer: Text("App made for study project: Mobile Apps for iOS systems")) {
                    Text("App version: 0.8.1")
                }
                if useFaceID {
                    Section(header: Text("FaceID")) {
                        
                        Button("Disable Face ID") {
                            useFaceID = false
                            faceIDEmail = ""
                            faceIDPassword = ""
                        }
                    }
                }
                Section {
                    Button(action: {
                        try? Auth.auth().signOut()
                        logStatus = false
                        
                    }, label: {
                        HStack{
                            Spacer()
                            Text("Log out")
                                .foregroundColor(.red)
                            Spacer()
                        }
                    })
                }
            }
        }
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
