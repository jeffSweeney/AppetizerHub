//
//  AccountViewModel.swift
//  AppetizerHub
//
//  Created by Jeffrey Sweeney on 5/24/24.
//

import Foundation

class AccountViewModel: ObservableObject {
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
    
    private func validateForm() {
        guard !user.firstName.isEmpty, !user.lastName.isEmpty, !user.email.isEmpty else {
            alertItem = APAlert.forError(error: .emptyTextField)
            showAlert = true
            
            return
        }
        
        guard user.email.isValidEmail else {
            alertItem = APAlert.forError(error: .invalidEmailFormat)
            showAlert = true
            
            return
        }
    }
    
    func saveChanges() {
        print("DEBUG: Save Changes Tapped!")
        
        validateForm()
    }
}
