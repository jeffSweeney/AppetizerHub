//
//  DismissButton.swift
//  AppetizerHub
//
//  Created by Jeffrey Sweeney on 5/21/24.
//

import SwiftUI

struct DismissButton: View {
    var body: some View {
        ZStack {
            Circle()
                .frame(width: 30, height: 30)
                .foregroundStyle(.white)
                .opacity(0.6)
            
            Image(systemName: "xmark")
                .imageScale(.small)
                .frame(width: 44, height: 44)
                .foregroundStyle(.brandPrimary)
                .bold()
        }
    }
}

#Preview {
    DismissButton()
}
