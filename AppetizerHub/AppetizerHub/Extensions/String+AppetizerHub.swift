//
//  String+AppetizerHub.swift
//  AppetizerHub
//
//  Created by Jeffrey Sweeney on 5/24/24.
//

import Foundation

extension String {
    var isValidEmail: Bool {
        guard !self.isEmpty else { return false }
        
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        
        return emailPred.evaluate(with: self)
    }
}
