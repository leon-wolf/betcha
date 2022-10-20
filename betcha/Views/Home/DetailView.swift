//
//  DetailView.swift
//  betcha
//
//  Created by Leon Wolf on 20.10.22.
//

import SwiftUI

struct DetailView: View {
    let entry: EntryModel
    
    var body: some View {
        VStack {
            Text(entry.id)
            Text(entry.label)
            Text(entry.createdAt)
        }
        .navigationTitle(entry.label)
    }
}
