//
//  MockData.swift
//  AppetizerHub
//
//  Created by Jeffrey Sweeney on 5/17/24.
//

import Foundation

struct MockData {
    static let sampleAppetizer = Appetizer(id: 123,
                                           name: "Test Appetizer",
                                           description: "Test App Descripion 😋",
                                           price: 7.99,
                                           imageURL: "",
                                           calories: 199,
                                           protein: 59,
                                           carbs: 29)
    
    static let appetizers = [sampleAppetizer, sampleAppetizer, sampleAppetizer, sampleAppetizer]
}
