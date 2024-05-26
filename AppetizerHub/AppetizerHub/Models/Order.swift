//
//  Order.swift
//  AppetizerHub
//
//  Created by Jeffrey Sweeney on 5/26/24.
//

import SwiftUI

final class Order: ObservableObject, Codable {
    @Published var appetizers: [Appetizer] = []
    
    enum CodingKeys: CodingKey {
        case appetizers
    }
    
    init() { }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        appetizers = try container.decode([Appetizer].self, forKey: .appetizers)
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(appetizers, forKey: .appetizers)
    }
    
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
