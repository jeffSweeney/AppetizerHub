//
//  AppetizerTabView.swift
//  AppetizerHub
//
//  Created by Jeffrey Sweeney on 5/17/24.
//

import SwiftUI

struct AppetizerTabView: View {
    @State private var selectedTab = 0
    
    var body: some View {
        TabView(selection: $selectedTab) {
            AppetizerListView()
                .tabItem {
                    Label("Home", systemImage: "house")
                        .environment(\.symbolVariants, selectedTab == 0 ? .fill : .none)
                }
                .tag(0)
            
            AccountView()
                .tabItem {
                    Label("Account", systemImage: "person")
                        .environment(\.symbolVariants, selectedTab == 1 ? .fill : .none)
                }
                .tag(1)
            
            OrderView()
                .tabItem {
                    Label("Order", systemImage: "bag")
                        .environment(\.symbolVariants, selectedTab == 2 ? .fill : .none)
                }
                .tag(2)
        }
        .tint(.brandPrimary)
    }
}

#Preview {
    AppetizerTabView()
}
