//
//  APAlert.swift
//  AppetizerHub
//
//  Created by Jeffrey Sweeney on 5/20/24.
//

import SwiftUI

struct AlertItem: Identifiable {
    let id = UUID()
    let title: String
    let message: Text
    
    static func forError(error: APError) -> Self {
        let message: String
        
        switch error {
        case .invalidUrl:
            message = "There was an issue connecting to the server. If this persists, please contact support."
            
        case .invalidResponse:
            message = "Invalid response from the server. Please try again later or contact support."
            
        case .invalidData:
            message = "The data received from the server was invalid. Please contact support."
            
        case .unableToComplete:
            message = "Unable to complete your request at this time. Please check your internet connection."
        }
        
        return AlertItem(title: "Server Error",
                         message: Text(message))
    }
}
