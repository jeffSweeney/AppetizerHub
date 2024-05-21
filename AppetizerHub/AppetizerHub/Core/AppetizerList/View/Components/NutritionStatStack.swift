//
//  NutritionStatStack.swift
//  AppetizerHub
//
//  Created by Jeffrey Sweeney on 5/21/24.
//

import SwiftUI

struct NutritionStatStack: View {
    let title: String
    let value: String
    
    var body: some View {
        VStack(spacing: 8) {
            Text(title)
                .font(.caption)
                .bold()
            
            Text(value)
                .font(.body)
                .fontWeight(.semibold)
                .italic()
                .foregroundStyle(.secondary)
        }
    }
}

#Preview {
    NutritionStatStack(title: "Calories", value: "740")
}
