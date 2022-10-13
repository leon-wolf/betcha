//
//  AppWriteService.swift
//  betcha
//
//  Created by Leon Wolf on 08.10.22.
//

import Foundation

import Appwrite

class AppwriteService {
    private(set) var client: Client
    private(set) var account: Account
    private(set) var database: Databases
    
    static let shared = AppwriteService()
    
    init() {
        self.client = Client()
            .setEndpoint(Secrets.API.endpoint)
            .setProject(Secrets.API.projectID)
            .setSelfSigned(true)
        
        self.account = Account(client)
        self.database = Databases(client)
    }
}
