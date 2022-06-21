//
//  LoginViewModel.swift
//  shoplist
//
//  Created by Patryk Jastrzębski on 08/06/2022.
//

import SwiftUI
import Firebase
import LocalAuthentication

class LoginViewModel: ObservableObject {
    @Published var email: String = ""
    @Published var password: String = ""
    
    //FaceID properties - save in local storage
    @AppStorage("use_face_id") var useFaceID: Bool = false
    @AppStorage("use_face_email") var faceIDEmail: String = ""
    @AppStorage("use_face_password") var faceIDPassword: String = ""
    
    //Log status
    @AppStorage("log_status") var logStatus: Bool = false
    
    func signIn(useFaceID: Bool, email: String = "", password: String = "") async throws {
        let _ = try await Auth.auth().signIn(withEmail: email != "" ? email: self.email, password: password != "" ? password: self.password)
        DispatchQueue.main.async {
            if useFaceID && self.faceIDEmail == "" {
                self.useFaceID = useFaceID
                self.faceIDEmail = self.email
                self.faceIDPassword = self.password
            }
            self.logStatus = true
        }
    }
    
    func signUp() async throws {
            let _ = try await Auth.auth().createUser(withEmail: email, password: password)
            do {
                try await signIn(useFaceID: false)
            } catch {
                print(error.localizedDescription)
            }
        }
    
    func getBiometricStatus() -> Bool  {
        let scanner = LAContext()
        return scanner.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: .none)
    }
    
    func authenticateUser() async throws {
        let status = try await  LAContext().evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: "To Login Into App")
        if status {
            try await signIn(useFaceID: useFaceID, email: self.faceIDEmail, password: self.faceIDPassword)
        }
    }
}
