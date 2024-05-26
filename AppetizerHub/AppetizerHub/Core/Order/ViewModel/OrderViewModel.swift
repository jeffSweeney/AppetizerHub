//
//  OrderViewModel.swift
//  AppetizerHub
//
//  Created by Jeffrey Sweeney on 5/26/24.
//

import Foundation

final class OrderViewModel: ObservableObject {
    @Published var appetizersOnOrder: [Appetizer] = []
    
    func removeFromOrder(at offsets: IndexSet) {
        appetizersOnOrder.remove(atOffsets: offsets)
    }
    
    func addToOrder(appetizer: Appetizer) {
        appetizersOnOrder.append(appetizer)
    }
    
    func primaryLabel() -> String {
        let totalPrice = appetizersOnOrder.reduce(0) { $0 + $1.price }
        
        return "\(totalPrice.asCurrency) - Place Order"
    }
}
