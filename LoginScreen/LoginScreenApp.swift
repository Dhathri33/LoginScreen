//
//  LoginScreenApp.swift
//  LoginScreen
//
//  Created by Dhathri Bathini on 11/12/25.
//

import SwiftUI

@main
struct LoginScreenApp: App {
    @StateObject private var loginObserver = LoginObserver()
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
