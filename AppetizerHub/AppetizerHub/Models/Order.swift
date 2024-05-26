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
    
    func removeFromOrder(at offsets: IndexSet) {
        appetizers.remove(atOffsets: offsets)
    }
    
    func placeOrderButtonLabel() -> String {
        let totalPrice = appetizers.reduce(0) { $0 + $1.price }
        
        return "\(totalPrice.asCurrency) - Place Order"
    }
}
