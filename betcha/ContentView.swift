//
//  ContentView.swift
//  betcha
//
//  Created by Leon Wolf on 07.10.22.
//

import SwiftUI

@MainActor
struct ContentView: View {
    @EnvironmentObject private var authVM: AuthViewModel
    @State private var showLogin: Bool = false
    
    var body: some View {
        if authVM.isLoggedIn, authVM.user != nil {
            TabView {
                    HomeView()
                        .tabItem {
                            Label("Home", systemImage: "house")
                        }
            }
        } else {
            LoginView()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
