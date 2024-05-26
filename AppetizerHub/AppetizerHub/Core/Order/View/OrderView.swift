//
//  OrderView.swift
//  AppetizerHub
//
//  Created by Jeffrey Sweeney on 5/17/24.
//

import SwiftUI

struct OrderView: View {
    @StateObject var viewModel = OrderViewModel()
    
    var body: some View {
        NavigationStack {
            VStack {
                List {
                    ForEach(viewModel.appetizersOnOrder) { appetizer in
                        AppetizerListCell(appetizer: appetizer)
                    }
                    .onDelete(perform: viewModel.removeFromOrder)
                }
                .listStyle(PlainListStyle())
                
                Spacer()
                
                Button(action: {
                    print("Tapped!")
                }, label: {
                    PrimaryButtonView(label: viewModel.primaryLabel())
                        .padding(.bottom)
                })
            }
            .navigationTitle("🧾 Order")
        }
    }
}

#Preview {
    OrderView(viewModel: MockData.orderViewModel)
}
