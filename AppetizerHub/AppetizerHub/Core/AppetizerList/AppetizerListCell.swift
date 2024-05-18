//
//  AppetizerListCell.swift
//  AppetizerHub
//
//  Created by Jeffrey Sweeney on 5/18/24.
//

import SwiftUI

struct AppetizerListCell: View {
    let appetizer: Appetizer
    
    var body: some View {
        HStack(spacing: 20) {
            Image(appetizer.imageURL) // TODO: Refactor to pull image url over network
                .resizable()
                .scaledToFit()
                .frame(width: 100, height: 75)
                .clipShape(RoundedRectangle(cornerRadius: 8))
            
            VStack(alignment: .leading, spacing: 5) {
                Text(appetizer.name)
                    .font(.title3)
                    .fontWeight(.medium)
                    .minimumScaleFactor(0.9)
                    .lineLimit(2)
                
                Text(appetizer.price.asCurrency)
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    .foregroundStyle(.secondary)
            }
            
            Spacer()
        }
    }
}

#Preview {
    AppetizerListCell(appetizer: MockData.sampleAppetizer)
}
