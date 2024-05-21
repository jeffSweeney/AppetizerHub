//
//  Image+AppetizerHub.swift
//  AppetizerHub
//
//  Created by Jeffrey Sweeney on 5/20/24.
//

import SwiftUI

extension Image {
    var asCellImage: some View {
        self
            .resizable()
            .scaledToFit()
            .frame(width: 100, height: 75)
            .clipShape(RoundedRectangle(cornerRadius: 8))
            .overlay {
                RoundedRectangle(cornerRadius: 8)
                    .stroke(.brandPrimary, lineWidth: 1.5)
            }
    }
    
    var asDetailImage: some View {
        self
            .resizable()
            .scaledToFit()
            .frame(width: 300, height: 225)
            .frame(maxWidth: .infinity)
    }
}
