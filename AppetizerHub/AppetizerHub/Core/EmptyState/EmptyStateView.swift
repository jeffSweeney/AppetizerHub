//
//  EmptyStateView.swift
//  AppetizerHub
//
//  Created by Jeffrey Sweeney on 5/26/24.
//

import SwiftUI

struct EmptyStateView: View {
    let context: EmptyContext
    
    enum EmptyContext {
        case emptyOrder
        
        var assetImage: String {
            switch self {
            case .emptyOrder:
                return "empty-order"
            }
        }
        
        var message: String {
            switch self {
            case .emptyOrder:
                return "You have no items in your order."
            }
        }
    }
    
    var body: some View {
        VStack {
            Image(context.assetImage)
                .resizable()
                .scaledToFit()
            .frame(height: 150)
            
            Text(context.message)
                .font(.title3)
                .fontWeight(.semibold)
                .foregroundStyle(.secondary)
                .padding(.horizontal)
                .multilineTextAlignment(.center)
                .lineLimit(4)
                .minimumScaleFactor(0.8)
        }
        .offset(y: -100)
    }
}

#Preview {
    EmptyStateView(context: .emptyOrder)
}
