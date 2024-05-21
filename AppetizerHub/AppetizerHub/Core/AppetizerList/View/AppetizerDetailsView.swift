//
//  AppetizerDetailsView_New.swift
//  AppetizerHub
//
//  Created by Jeffrey Sweeney on 5/21/24.
//

import SwiftUI

struct AppetizerDetailsView: View {
    let appetizer: Appetizer
    
    var body: some View {
        VStack(spacing: 24) {
            AsyncImage(url: URL(string: appetizer.imageURL),
                       content: { configureImage(with: $0) },
                       placeholder: { configureImage() })
            
            VStack {
                Text(appetizer.name)
                    .font(.title2)
                    .fontWeight(.semibold)
                
                Text(appetizer.description)
                    .multilineTextAlignment(.center)
                    .font(.body)
                    .padding()
                
                HStack(spacing: 24) {
                    NutritionStatStack(title: "Calories", value: "\(appetizer.calories)")
                    NutritionStatStack(title: "Carbs", value: "\(appetizer.carbs) g")
                    NutritionStatStack(title: "Protien", value: "\(appetizer.protein) g")
                }
            }
            
            Spacer()
            
            Button(action: {
                print("Tapped!")
            }, label: {
                Text("Button")
            })
            .padding(.bottom, 30)
        }
        .frame(width: 300, height: 525)
        .background(Color(.systemBackground))
        .clipShape(RoundedRectangle(cornerRadius: 12))
        .shadow(radius: 40)
        .overlay(alignment: .topTrailing) {
            Button(action: {
                print("Dismissed")
            }, label: {
                Image(systemName: "x.circle.fill")
                    .imageScale(.large)
                    .foregroundStyle(Color(.systemBackground))
                    .padding()
            })
        }
    }
    
    private func configureImage(with inputImage: Image? = nil) -> some View {
        let image = inputImage ?? Image("asian-flank-steak")
        
        return image
            .resizable()
            .scaledToFit()
            .frame(width: 300, height: 225)
            .frame(maxWidth: .infinity)
    }
}

#Preview {
    AppetizerDetailsView(appetizer: MockData.sampleAppetizer)
}
