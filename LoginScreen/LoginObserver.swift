//
//  LoginObserver.swift
//  LoginScreen
//
//  Created by Dhathri Bathini on 11/12/25.
//
import Combine
import Foundation

class LoginObserver: ObservableObject {
    private var observer: Any?

    init() {
        observer = NotificationCenter.default.addObserver(
            forName: .loginButtonPressed,
            object: nil,
            queue: .main
        ) { notification in
            if let username = notification.userInfo?["username"] as? String {
                print("Received login notification for user \(username)")
            }
        }
    }

    deinit {
        if let observer = observer {
            NotificationCenter.default.removeObserver(observer)
        }
    }
}
