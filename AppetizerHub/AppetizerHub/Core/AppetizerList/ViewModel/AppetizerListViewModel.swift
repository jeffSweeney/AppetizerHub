//
//  AppetizerListViewModel.swift
//  AppetizerHub
//
//  Created by Jeffrey Sweeney on 5/19/24.
//

import SwiftUI

final class AppetizerListViewModel: ObservableObject {
    @Published var appetizers: [Appetizer] = []
    @Published var showAlert = false
    @Published var isLoading = true
    
    var alertItem: AlertItem? {
        didSet {
            if alertItem == nil {
                showAlert = false
            } else {
                showAlert = true
            }
        }
    }
    
    @MainActor
    func getAppetizers() async {
        isLoading = true
        
        let result = await NetworkManager.shared.getAppetizers()
        
        switch result {
        case .success(let appetizers):
            self.appetizers = appetizers
            
        case .failure(let error):
            alertItem = AlertItem.forError(error: error)
        }
        
        sleep(1) // Prevent quick transition
        
        isLoading = false
    }
}
