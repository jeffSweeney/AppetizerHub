//
//  AppetizerListView.swift
//  AppetizerHub
//
//  Created by Jeffrey Sweeney on 5/17/24.
//

import SwiftUI

struct AppetizerListView: View {
    @StateObject private var viewModel = AppetizerListViewModel()
    
    var body: some View {
        NavigationStack {
            List(viewModel.appetizers) { appetizer in
                AppetizerListCell(appetizer: appetizer)
            }
            .navigationTitle("🍱 Appetizers")
        }
        .onAppear {
            // MARK: - Completion Handler call (approach in tutorial)
//            viewModel.getAppetizers()
            
            // MARK: Async / Await call (my challenge addition)
            Task {
                await viewModel.getAppetizers()
            }
        }
    }
}

#Preview {
    AppetizerListView()
}
