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
    
    func saveChanges() {
        print("DEBUG: Save Changes Tapped!")
    }
}
