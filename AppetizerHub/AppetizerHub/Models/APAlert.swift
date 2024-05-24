//
//  APAlert.swift
//  AppetizerHub
//
//  Created by Jeffrey Sweeney on 5/20/24.
//

import SwiftUI

struct APAlert: Identifiable {
    let id = UUID()
    let title: String
    let message: Text
    
    static func forError(error: APError) -> Self {
        let title: String
        let message: String
        
        switch error {
        case .emptyTextField:
            title = "Form Error"
            message = "Must provide a value for First Name, Last Name, Email."
            
        case .invalidData:
            title = "Server Error"
            message = "The data received from the server was invalid. Please contact support."
            
        case .invalidEmailFormat:
            title = "Form Error"
            message = "Email must be in valid email format."
            
        case .invalidResponse:
            title = "Server Error"
            message = "Invalid response from the server. Please try again later or contact support."
            
        case .invalidUrl:
            title = "Server Error"
            message = "There was an issue connecting to the server. If this persists, please contact support."
        
        case .unableToComplete:
            title = "Server Error"
            message = "Unable to complete your request at this time. Please check your internet connection."
        }
        
        return APAlert(title: title,
                       message: Text(message))
    }
}
