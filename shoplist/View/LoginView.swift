

import SwiftUI

struct LoginView: View {
    @StateObject var viewModel: LoginViewModel = LoginViewModel()
    @State var useFaceID: Bool = false
    
    var body: some View {
        NavigationView {
            VStack {
                VStack {
                    Text("🥳")
                        .font(.system(size: 50))
                        .hLeading()
                    Text("Zaloguj się.")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .foregroundColor(Color("yellow"))
                        .hLeading()
                    Text("Witaj ponownie.")
                        .font(.title)
                        .hLeading()
                    Text("Brakowało nam Ciebie.")
                        .font(.title)
                        .hLeading()
                    
                }
                .padding(.top, -40)
                .padding(.leading, 20)
                Spacer()
                    .frame(minHeight: 0, maxHeight: 50)
                TextField(
                    "E-mail",
                    text: $viewModel.email
                )
                .padding()
                .background {
                    RoundedRectangle(cornerRadius: 8)
                        .fill(
                            "" == "" ? Color.black.opacity(0.05) : Color(.gray).opacity(0.2)
                        )
                }.textInputAutocapitalization(.never)
                    .padding()
                SecureField(
                    "Hasło",
                    text: $viewModel.password)
                .padding()
                .background {
                    RoundedRectangle(cornerRadius: 8)
                        .fill(
                            "" == "" ? Color.black.opacity(0.05) : Color(.gray).opacity(0.2)
                        )
                }.textInputAutocapitalization(.never)
                    .padding()
                    .padding(.top, -10)
                
                if viewModel.getBiometricStatus() {
                    Group {
                        if viewModel.useFaceID {
                            Button {
                                Task {
                                    do {
                                        try await viewModel.authenticateUser()
                                    } catch {
                                        // print(error.localizedDescription)
                                    }
                                }
                            } label: {
                                VStack(alignment: .leading, spacing: 10) {
                                    Label {
                                        Text("Use FaceID to login into previous account")
                                    } icon: {
                                        Image(systemName: "faceid")
                                    }
                                    .font(.caption)
                                    .foregroundColor(.gray)
                                    Text("Note: You can turn off it in settings!")
                                        .font(.caption2)
                                        .foregroundColor(.gray)
                                }.hLeading()
                            }
                        } else {
                            Toggle(isOn: $useFaceID) {
                                Text("Use FaceID to Login")
                                    .foregroundColor(.gray)
                            }
                        }
                    }
                    .padding(20)
                }
                Spacer()
                HStack {
                    Text("Nie masz konta?")
                    NavigationLink(destination: {RegisterView()}, label: {
                        Text("Zarejestruj się")
                    })
                }
                Button(action: {
                    Task {
                        do {
                            try await viewModel.signIn(useFaceID: useFaceID)
                        }
                    }
                }, label: {
                    Text("Zaloguj się")
                        .fontWeight(.semibold)
                        .frame(maxWidth: .infinity,minHeight: 50, maxHeight: 60)
                        .background(.yellow)
                        .cornerRadius(20, antialiased: true)
                        .foregroundColor(.white)
                })
                .opacity(viewModel.email == "" || viewModel.password == "" ? 0.5 : 1)
                .disabled(viewModel.email == "" || viewModel.password == "" ? true : false)
                .padding()
            }
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}

extension View {
    func hLeading() -> some View {
        self
            .frame(maxWidth: .infinity, alignment: .leading)
    }
}
