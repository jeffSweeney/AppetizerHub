//
//  PastOrderCell.swift
//  AppetizerHub
//
//  Created by Jeffrey Sweeney on 5/26/24.
//

import SwiftUI

struct PastOrderCell: View {
    let order: Order
    
    var body: some View {
        HStack {
            if let app = order.appetizers.first {
                let remaining = order.appetizers.count > 1 ?
                ", +\(order.appetizers.count-1)" : ""
                Text("\(app.name)\(remaining)")
            }
            
            Spacer()
            
            Text(order.currencyTotal)
        }
    }
}

#Preview {
    PastOrderCell(order: MockData.order)
}
