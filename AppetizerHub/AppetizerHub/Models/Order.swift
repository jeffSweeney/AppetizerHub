//
//  Order.swift
//  AppetizerHub
//
//  Created by Jeffrey Sweeney on 5/26/24.
//

import SwiftUI

final class Order: ObservableObject {
    @Published var appetizers: [Appetizer] = []
    
    func add(_ app: Appetizer) {
        appetizers.append(app)
    }
}
