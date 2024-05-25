//
//  AccountViewModel.swift
//  AppetizerHub
//
//  Created by Jeffrey Sweeney on 5/24/24.
//

import SwiftUI

class AccountViewModel: ObservableObject {
    // Obviously not ideal, but server-side DB isn't the goal of this app practice.
    @AppStorage("user") private var userData: Data?
    
    @Published var user = User()
    @Published var showAlert = false
    
    var alertItem: APAlert? {
        didSet {
            if alertItem == nil {
                showAlert = false
            } else {
                showAlert = true
            }
        }
    }
    
    func saveChanges() {
        guard isValidForm() else {
            return
        }
        
        do {
            let data = try JSONEncoder().encode(user)
            userData = data
            
            alertItem = APAlert.forSuccess(success: .userEncodingSuccess)
        } catch {
            alertItem = APAlert.forError(error: .userEncodingFailure)
        }
    }
    
    func retrieveUser() {
        
    }
}

// MARK: - Validation Helpers
extension AccountViewModel {
    private func isValidForm() -> Bool {
        guard !user.firstName.isEmpty, !user.lastName.isEmpty, !user.email.isEmpty else {
            alertItem = APAlert.forError(error: .emptyTextField)
            showAlert = true
            
            return false
        }
        
        guard user.email.isValidEmail else {
            alertItem = APAlert.forError(error: .invalidEmailFormat)
            showAlert = true
            
            return false
        }
        
        return true
    }
}
