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
        ZStack {
            NavigationStack {
                List(viewModel.appetizers) { appetizer in
                    AppetizerListCell(appetizer: appetizer)
                        .onTapGesture {
                            viewModel.selectedAppetizer = appetizer
                        }
                }
                .navigationTitle("🍱 Appetizers")
                .opacity(viewModel.isLoading ? 0.25 : 1)
                .disabled(viewModel.isLoading || viewModel.selectedAppetizer != nil)
            }
            .onAppear {
                Task {
                    await viewModel.getAppetizers()
                }
            }
            .blur(radius: viewModel.selectedAppetizer != nil ? 20 : 0)
            
            if viewModel.selectedAppetizer != nil {
                AppetizerDetailsView(viewModel: viewModel)
            }
            
            if viewModel.isLoading {
                LoadingView()
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
