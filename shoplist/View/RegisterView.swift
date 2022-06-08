//
//  RegisterView.swift
//  shoplist
//
//  Created by Patryk Jastrzębski on 05/06/2022.
//

import SwiftUI

struct RegisterView: View {
    @State private var username: String = ""
    @State private var password: String = ""
    var body: some View {
        VStack {
            VStack {
                Text("Welcome to family")
                    .font(.largeTitle)
                    .fontWeight(.bold)
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
                    text: $username
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
                text: $password)
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
                text: $password)
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
            Button(action: {}, label: {
                Text("Sign up")
                    .fontWeight(.semibold)
                    .frame(maxWidth: .infinity,minHeight: 50, maxHeight: 60)
                    .background(.black)
                    .cornerRadius(20, antialiased: true)
                    .foregroundColor(.white)

            }).padding()
        }
    }
}

struct RegisterView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterView()
    }
}
