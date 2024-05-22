//
//  PrimaryButtonView.swift
//  AppetizerHub
//
//  Created by Jeffrey Sweeney on 5/21/24.
//

import SwiftUI

struct PrimaryButtonView: View {
    let label: String
    
    var body: some View {
        Text(label)
            .font(.title3)
            .fontWeight(.semibold)
            .frame(width: 250, height: 50)
            .background(.brandPrimary)
            .foregroundStyle(.white)
            .clipShape(RoundedRectangle(cornerRadius: 10))
    }
}

#Preview {
    PrimaryButtonView(label: "Click Me!")
}
