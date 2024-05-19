//
//  AppetizerListView.swift
//  AppetizerHub
//
//  Created by Jeffrey Sweeney on 5/17/24.
//

import SwiftUI

struct AppetizerListView: View {
    @State private var appetizers: [Appetizer] = []
    
    var body: some View {
        NavigationStack {
            List(appetizers) { appetizer in
                AppetizerListCell(appetizer: appetizer)
            }
            .navigationTitle("🍱 Appetizers")
        }
        .onAppear {
            getAppetizers()
        }
    }
}

extension AppetizerListView {
    @MainActor
    func getAppetizers() {
        NetworkManager.shared.getAppetizers { result in
            switch result {
            case .success(let appetizers):
                DispatchQueue.main.async {
                    self.appetizers = appetizers
                }
            case .failure(let error):
                print(error.localizedDescription) // TODO: Handle this
            }
        }
    }
}

#Preview {
    AppetizerListView()
}
