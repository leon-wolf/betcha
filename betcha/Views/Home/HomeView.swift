//
//  HomeView.swift
//  betcha
//
//  Created by Leon Wolf on 09.10.22.
//

import SwiftUI

struct HomeView: View {
    @EnvironmentObject private var authVM: AuthViewModel
    
    var body: some View {
        VStack {
            if let user = authVM.user {
                Text("Helllo, \(user.name)")
                Text("Your Email: \(user.email)")
                Text("Your registration date: \(user.registration)")
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
