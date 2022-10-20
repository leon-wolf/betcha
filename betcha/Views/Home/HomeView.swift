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
        NavigationView {
            List {
                ForEach(entryVM.entryList, id: \.id) { entry in
                    NavigationLink(
                        destination: DetailView(entry: entry)
                    ) {
                        VStack(alignment: .leading) {
                            Text(entry.label)
                            Text(entry.createdAt)
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
}
