//
//  MockData.swift
//  AppetizerHub
//
//  Created by Jeffrey Sweeney on 5/17/24.
//

import Foundation

struct MockData {
    static let sampleAppetizer = Appetizer(id: 123,
                                           name: "Asian Flank Steak",
                                           description: "Yummy flank steak 😋",
                                           price: 7.99,
                                           imageURL: "asian-flank-steak",
                                           calories: 199,
                                           protein: 59,
                                           carbs: 29)
    
    static let appetizers = [sampleAppetizer, sampleAppetizer, sampleAppetizer, sampleAppetizer]
}
