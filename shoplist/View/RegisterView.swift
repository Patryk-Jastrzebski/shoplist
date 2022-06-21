
import SwiftUI

struct RegisterView: View {
    @State var passwordOne: String = ""
    @StateObject var viewModel: LoginViewModel = LoginViewModel()
    var body: some View {
        VStack {
            VStack {
                Text("Welcome to family")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(Color("yellow"))
                    .hLeading()
                Text("Be part of our \ncommunity.")
                    .font(.title)
                    .frame(maxWidth: .infinity, alignment: .leading)
                
            }.padding(25)
                .padding(.top, -90)
            
            Spacer()
                .frame(minHeight: -20, maxHeight: 50)
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
                "Password",
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
            SecureField(
                "Re-type password",
                text: $passwordOne)
                .padding()
                .background {
                    RoundedRectangle(cornerRadius: 8)
                        .fill(
                            "" == "" ? Color.black.opacity(0.05) : Color(.gray).opacity(0.2)
                        )
                }.textInputAutocapitalization(.never)
                .padding()
                .padding(.top, -10)
            Spacer()
            Button{
                Task {
                    do {
                        try await viewModel.signUp()
                    } catch {
                        print(error.localizedDescription)
                    }
                }
            } label: {
                Text("Sign up")
                    .fontWeight(.semibold)
                    .frame(maxWidth: .infinity,minHeight: 50, maxHeight: 60)
                    .background(Color("yellow"))
                    .cornerRadius(20, antialiased: true)
                    .foregroundColor(.white)
                
            }
                    .disabled(viewModel.email == "" || viewModel.password != passwordOne || viewModel.password == "")
                    .opacity(viewModel.email == "" || viewModel.password != passwordOne || viewModel.password == "" ? 0.5 : 1)
                .padding()
        }
    }
}

struct RegisterView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterView()
    }
}
