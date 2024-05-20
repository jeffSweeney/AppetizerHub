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
            Task {
                await viewModel.getAppetizers()
            }
        }
        .alert(viewModel.alertItem?.title ?? "Error",
               isPresented: $viewModel.showAlert,
               actions: { Button("OK") { viewModel.alertItem = nil } },
               message: { viewModel.alertItem?.message ?? Text("Unexpected Error - Try Again.") }
        )
    }
}

#Preview {
    AppetizerListView()
}
