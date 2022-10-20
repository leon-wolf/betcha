//
//  DebugView.swift
//  betcha
//
//  Created by Leon Wolf on 19.10.22.
//

import SwiftUI

struct DebugView: View {
    @EnvironmentObject private var authVM: AuthViewModel
    @EnvironmentObject private var entryVM: EntryViewModel
    
    var body: some View {
        List {
            Button("Reset Offline Data") {
                Task {
                    await entryVM.resetEntries()
                }
            }
            Button("Log Out") {
                Task {
                    authVM.logout()
                }
            }
        }
    }
}

struct DebugView_Previews: PreviewProvider {
    static var previews: some View {
        DebugView()
    }
}
