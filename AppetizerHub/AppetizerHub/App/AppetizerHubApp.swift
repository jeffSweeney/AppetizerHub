//
//  AppetizerHubApp.swift
//  AppetizerHub
//
//  Created by Jeffrey Sweeney on 5/17/24.
//

import SwiftUI

@main
struct AppetizerHubApp: App {
    var order = Order()
    
    var body: some Scene {
        WindowGroup {
            AppetizerTabView()
                .environmentObject(order)
        }
    }
}
