//
//  Double+AppetizerHub.swift
//  AppetizerHub
//
//  Created by Jeffrey Sweeney on 5/18/24.
//

import Foundation

extension Double {
    var asCurrency: String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        formatter.currencyCode = "USD"
        
        return formatter.string(from: NSNumber(value: self)) ?? "$0.00"
    }
}
