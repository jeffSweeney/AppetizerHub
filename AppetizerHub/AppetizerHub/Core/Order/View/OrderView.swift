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
            Text("Order View!")
                .navigationTitle("🧾 Order")
        }
    }
}

#Preview {
    OrderView()
}
