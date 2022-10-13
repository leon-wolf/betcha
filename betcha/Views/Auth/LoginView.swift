//
//  LoginView.swift
//  betcha
//
//  Created by Leon Wolf on 08.10.22.
//

import SwiftUI

@MainActor
struct LoginView: View {
    @EnvironmentObject private var authVM: AuthViewModel
    @Environment(\.presentationMode) var presentationMode
    
    @State private var username: String = ""
    @State private var password: String = ""
    
    var body: some View {
        VStack {
            TextField(text: $username) {
                Text("Email")
            }
            .keyboardType(.emailAddress)
            .autocorrectionDisabled(true)
            .textInputAutocapitalization(.never)
            .padding()
            SecureField(text: $password) {
                Text("Password")
            }
            .padding()
            Button {
                Task {
                    await authVM.login(email: username, password: password)
                }
                if authVM.isLoggedIn {
                    presentationMode.wrappedValue.dismiss()
                }
            } label: {
                Text("Login")
            }
            .buttonStyle(.bordered)
        }
        .padding()
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
