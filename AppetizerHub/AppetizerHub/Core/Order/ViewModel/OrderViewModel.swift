//
//  OrderViewModel.swift
//  AppetizerHub
//
//  Created by Jeffrey Sweeney on 5/26/24.
//

import Foundation

final class OrderViewModel: ObservableObject {
    @Published var appetizersOnOrder: [Appetizer] = []
    
    func removeFromOrder(appetizer: Appetizer) {
        let removalIndex = appetizersOnOrder.firstIndex { $0 == appetizer }
        guard let removalIndex else { return }
        
        appetizersOnOrder.remove(at: removalIndex)
    }
    
    func addToOrder(appetizer: Appetizer) {
        appetizersOnOrder.append(appetizer)
    }
}
