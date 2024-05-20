//
//  LoadingView.swift
//  AppetizerHub
//
//  Created by Jeffrey Sweeney on 5/20/24.
//

import SwiftUI

struct LoadingView: View {
    var body: some View {
        ProgressView()
            .progressViewStyle(.circular)
            .controlSize(.extraLarge)
            .tint(.brandPrimary)
    }
}

#Preview {
    LoadingView()
}
