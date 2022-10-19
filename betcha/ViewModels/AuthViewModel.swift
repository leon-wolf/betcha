//
//  AuthViewModel.swift
//  betcha
//
//  Created by Leon Wolf on 08.10.22.
//

import Appwrite
import Foundation

@MainActor
class AuthViewModel: ObservableObject {
    @Published var isLoggedIn = false
    @Published var error: String?
    @Published var user: AppwriteModels.Account?
    
    static let shared = AuthViewModel()
    
    init() {
        getAccount()
    }
    
    private func getAccount() {
        AppwriteService.shared.account.get { result in
            DispatchQueue.main.async {
                switch result {
                    case let .failure(err):
                        self.error = err.message
                        self.isLoggedIn = false
                    case let .success(user):
                        self.user = user
                        self.isLoggedIn = true
                }
            }
        }
    }
    
    func create(name: String, email: String, password: String) {
        AppwriteService.shared.account.create(userId: ID.unique(), email: email, password: password, name: name) { result in
            switch result {
                case let .failure(err):
                    DispatchQueue.main.async {
                        print(err.message)
                        self.error = err.message
                    }
                case .success:
                    Task {
                        await self.login(email: email, password: password)
                    }
            }
        }
    }
    
    func logout() {
        AppwriteService.shared.account.deleteSession(sessionId: "current") { result in
            DispatchQueue.main.async {
                switch result {
                    case let .failure(err):
                        self.error = err.message
                    case .success:
                        self.isLoggedIn = false
                        self.error = nil
                }
            }
        }
    }
    
    func loginAnonymous() {
        AppwriteService.shared.account.createAnonymousSession { result in
            switch result {
                case let .failure(err):
                    DispatchQueue.main.async {
                        self.error = err.message
                    }
                case .success:
                    self.getAccount()
            }
        }
    }
    
    public func login(email: String, password: String) async {
        Task {
            do {
                _ = try await AppwriteService.shared.account.createEmailSession(email: email, password: password)
                getAccount()
            } catch {
                print("Error: \(error.localizedDescription)")
            }
        }
    }
}
