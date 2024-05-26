//
//  OrderView.swift
//  AppetizerHub
//
//  Created by Jeffrey Sweeney on 5/17/24.
//

import SwiftUI

struct OrderView: View {
    @EnvironmentObject var order: Order
    
    var body: some View {
        NavigationStack {
            VStack {
                if order.appetizers.isEmpty {
                    EmptyStateView(context: .emptyOrder)
                } else {
                    List {
                        ForEach(order.appetizers) { appetizer in
                            AppetizerListCell(appetizer: appetizer)
                        }
                        .onDelete(perform: order.removeFromOrder)
                    }
                    .listStyle(PlainListStyle())
                    
                    Spacer()
                    
                    Button(action: {
                        print("Tapped!")
                    }, label: {
                        PrimaryButtonView(label: "\(order.currencyTotal) - Place Order")
                            .padding(.bottom)
                    })
                }
            }
            .navigationTitle("🧾 Order")
        }
    }
}

#Preview {
    OrderView()
        .environmentObject(MockData.order)
}
