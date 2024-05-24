//
//  AccountViewModel.swift
//  AppetizerHub
//
//  Created by Jeffrey Sweeney on 5/24/24.
//

import Foundation

class AccountViewModel: ObservableObject {
    @Published var firstName = ""
    @Published var lastName = ""
    @Published var email = ""
    @Published var birthday = Date()
    @Published var extraNapkinsIsOn = false
    @Published var frequntRefills = false
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
        guard !firstName.isEmpty, !lastName.isEmpty, !email.isEmpty else {
            alertItem = APAlert.forError(error: .emptyTextField)
            showAlert = true
            
            return
        }
        
        guard email.isValidEmail else {
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
