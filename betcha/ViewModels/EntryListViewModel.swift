//
//  EntryViewModel.swift
//  betcha
//
//  Created by Leon Wolf on 13.10.22.
//

import SwiftUI

@MainActor
class EntryViewModel: ObservableObject {
    static let shared = EntryViewModel()
    
    @Published var entryList: [EntryModel] = []
    
    init() {}
    
    func getEntries() async {
        do {
            let documentList = try await AppwriteService.shared.database.listDocuments(
                databaseId: Secrets.Database.id,
                collectionId: Secrets.Database.Collections.Entry.id
            )
            let documents = documentList.convertTo(fromJson: EntryModel.from)
            entryList = documents
            print("entries: \(documents)")
        } catch {
            print("Error: \(error.localizedDescription)")
        }
    }
}
