//
//  betchaApp.swift
//  betcha
//
//  Created by Leon Wolf on 07.10.22.
//

import Appwrite
import AppwriteModels
import SwiftUI

@main
struct betchaApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(AuthViewModel.shared)
        }
    }
}
