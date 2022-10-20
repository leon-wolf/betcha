//
//  HomeView.swift
//  betcha
//
//  Created by Leon Wolf on 09.10.22.
//

import SwiftUI

struct HomeView: View {
    @EnvironmentObject private var authVM: AuthViewModel
    @EnvironmentObject private var entryVM: EntryViewModel
    
    var body: some View {
        ScrollView {
            LazyVStack {
                ForEach(entryVM.entryList, id: \.id) { entry in
                    HStack {
                        Text(entry.label)
                        Text(entry.createdAt)
                    }
                    .background {
                        Color.red
                    }
                }
            }
        }
        .refreshable {
            Task {
                await entryVM.getEntries()
            }
        }
        .onAppear {
            if entryVM.entryList.count == 0 {
                Task {
                    await entryVM.getEntries()
                }
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
