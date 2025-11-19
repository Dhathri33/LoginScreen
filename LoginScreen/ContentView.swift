//
//  ContentView.swift
//  LoginScreen
//
//  Created by Dhathri Bathini on 11/12/25.
//

import SwiftUI

struct ContentView: View {
    @State private var username: String = ""
    @State private var password: String = ""

       var body: some View {
           VStack(spacing: 24) {
               Text("Login")
                   .font(.title)
                   .bold()
                   .accessibilityAddTraits(.isHeader) // VoiceOver: header

               VStack(alignment: .leading, spacing: 8) {
                   Text("Email")
                       .font(.headline)
                   TextField(NSLocalizedString("email_placeholder", comment: ""), text: $username)
                       .padding(12)
                       .overlay(
                           RoundedRectangle(cornerRadius: 8)
                               .stroke(.gray.opacity(0.4), lineWidth: 1)
                       )
                       .accessibilityLabel("Email address")
                       .accessibilityHint("Enter the email you use to sign in")
               }

               VStack(alignment: .leading, spacing: 8) {
                   Text("Password")
                       .font(.headline)
                   SecureField(NSLocalizedString("password_placeholder", comment: ""), text: $password)
                       .textContentType(.password)
                       .padding(12)
                       .overlay(
                           RoundedRectangle(cornerRadius: 8)
                               .stroke(.gray.opacity(0.4), lineWidth: 1)
                       )
                       .accessibilityLabel("Password")
                       .accessibilityHint("Enter your account password")
               }

               Button(action: loginTapped) {
                   Text("Log In")
                       .font(.headline)
                       .frame(maxWidth: .infinity)
                       .padding()
                       .background(username.isEmpty || password.isEmpty ? Color.gray.opacity(0.4) : Color.blue)
                       .foregroundColor(.white)
                       .cornerRadius(10)
               }
               .accessibilityLabel("Log in")
               .accessibilityHint("Attempts to log in with the entered email and password")
               .disabled(username.isEmpty || password.isEmpty)
               .padding(.top, 8)
               Spacer()
           }
           .padding()
       }

       private func loginTapped() {
           print("Login button tapped with username: \(username)")
           NotificationCenter.default.post(
               name: .loginButtonPressed,
               object: nil,
               userInfo: ["username": username]
           )
       }
}

#Preview {
    ContentView()
}
