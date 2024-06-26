//
//  MockData.swift
//  AppetizerHub
//
//  Created by Jeffrey Sweeney on 5/17/24.
//

import Foundation

struct MockData {
    static let sampleAppetizer = Appetizer(id: 123,
                                           name: "Asian Flank Steak",
                                           description: "Yummy flank steak 😋 that is sure to impress the whole party!",
                                           price: 7.99,
                                           imageURL: "asian-flank-steak",
                                           calories: 199,
                                           protein: 59,
                                           carbs: 29)
    
    static let sampleAppetizer2 = Appetizer(id: 456,
                                            name: "Big Burger",
                                            description: "Big burger that you know you want to eat!",
                                            price: 9.99,
                                            imageURL: "",
                                            calories: 457,
                                            protein: 23,
                                            carbs: 17)
    
    static let appetizers = [sampleAppetizer, sampleAppetizer, sampleAppetizer, sampleAppetizer]
    
    static var detailViewModel: AppetizerListViewModel {
        let viewModel = AppetizerListViewModel()
        viewModel.selectedAppetizer = Self.sampleAppetizer
        
        return viewModel
    }
    
    static var order: Order {
        let order = Order()
        order.appetizers.append(sampleAppetizer)
        order.appetizers.append(sampleAppetizer2)
        
        return order
    }
    
    static var order2: Order {
        let order = Order()
        order.appetizers.append(sampleAppetizer)
        
        return order
    }
    
    static var accountViewModel: AccountViewModel {
        let vm = AccountViewModel()
        vm.user.orders = [order, order2]
        
        return vm
    }
}
