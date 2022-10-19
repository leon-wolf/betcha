//
//  EntryModel.swift
//  betcha
//
//  Created by Leon Wolf on 13.10.22.
//

import Appwrite
import AppwriteModels
import Foundation

struct EntryModel: Identifiable, Decodable {
    var id: String = Appwrite.ID.unique()
    let label: String
    let createdAt: String
    
    public static func from(map: [String: Any]) -> EntryModel {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
        return EntryModel(
            id: map["$id"] as! String,
            label: map["label"]  as! String,
            createdAt: map["$createdAt"] as! String
        )
    }
}
