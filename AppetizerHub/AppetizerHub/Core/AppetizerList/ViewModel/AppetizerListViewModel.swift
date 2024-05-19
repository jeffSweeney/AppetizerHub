//
//  AppetizerListViewModel.swift
//  AppetizerHub
//
//  Created by Jeffrey Sweeney on 5/19/24.
//

import Foundation

final class AppetizerListViewModel: ObservableObject {
    @Published var appetizers: [Appetizer] = []
    
    // MARK: - Completion Handler call (approach in tutorial)
    func getAppetizers() {
        NetworkManager.shared.getAppetizers { [weak self] result in
            guard let self else { return }
            
            switch result {
            case .success(let appetizers):
                DispatchQueue.main.async {
                    self.appetizers = appetizers
                }
            case .failure(let error):
                print(error.localizedDescription) // TODO: handle
            }
        }
    }
    
    // MARK: Async / Await call (my challenge addition)
    @MainActor
    func getAppetizers() async {
        let result = await NetworkManager.shared.getAppetizers()
        
        switch result {
        case .success(let appetizers):
            self.appetizers = appetizers
        case .failure(let error):
            print(error.localizedDescription) // TODO: handle
        }
    }
}
