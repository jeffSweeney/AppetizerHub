//
//  Order.swift
//  AppetizerHub
//
//  Created by Jeffrey Sweeney on 5/26/24.
//

import SwiftUI

final class Order: ObservableObject, Codable, Identifiable {
    @Published var id: UUID = UUID()
    @Published var appetizers: [Appetizer] = []
    
    enum CodingKeys: CodingKey {
        case id, appetizers
    }
    
    init() { }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        id = try container.decode(UUID.self, forKey: .id)
        appetizers = try container.decode([Appetizer].self, forKey: .appetizers)
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(id, forKey: .id)
        try container.encode(appetizers, forKey: .appetizers)
    }
    
    func add(_ app: Appetizer) {
        appetizers.append(app)
    }
    
    func removeFromOrder(at offsets: IndexSet) {
        appetizers.remove(atOffsets: offsets)
    }
    
    var currencyTotal: String {
        let totalPrice = appetizers.reduce(0) { $0 + $1.price }
        
        return "\(totalPrice.asCurrency)"
    }
}
