//
//  NutritionStatStack.swift
//  AppetizerHub
//
//  Created by Jeffrey Sweeney on 5/21/24.
//

import SwiftUI

struct NutritionStatStack: View {
    let title: String
    let value: Int
    let unit: String?
    
    private var valueLabel: String {
        var label = "\(value)"
        
        guard let unit else { return label }
        
        return "\(label) \(unit)"
    }
    
    var body: some View {
        VStack(spacing: 8) {
            Text(title)
                .font(.caption)
                .bold()
            
            Text(valueLabel)
                .font(.body)
                .fontWeight(.semibold)
                .italic()
                .foregroundStyle(.secondary)
        }
    }
}

#Preview {
    NutritionStatStack(title: "Calories", value: 740, unit: nil)
}
