//
//  AppetizerDetailsView.swift
//  AppetizerHub
//
//  Created by Jeffrey Sweeney on 5/21/24.
//

import SwiftUI

struct AppetizerDetailsView: View {
    @EnvironmentObject var order: Order
    @ObservedObject var viewModel: AppetizerListViewModel
    
    let appetizer: Appetizer
    
    init?(viewModel: AppetizerListViewModel) {
        guard let appetizer = viewModel.selectedAppetizer else {
            return nil
        }
        
        self._viewModel = ObservedObject(wrappedValue: viewModel)
        self.appetizer = appetizer
    }
    
    var body: some View {
        VStack(spacing: 24) {
            AsyncImage(url: URL(string: appetizer.imageURL),
                       content: { $0.asDetailImage },
                       placeholder: { Image("food-placeholder").asDetailImage.background(.brandPrimary) })
            
            VStack(spacing: 24) {
                Text(appetizer.name)
                    .font(.title2)
                    .fontWeight(.semibold)
                
                Text(appetizer.description)
                    .padding(.horizontal)
                    .multilineTextAlignment(.center)
                    .font(.body)
                    .lineLimit(2)
                    .fixedSize(horizontal: false, vertical: /*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/)
                    .minimumScaleFactor(0.8)
                
                HStack(spacing: 24) {
                    NutritionStatStack(title: "Calories", value: appetizer.calories, unit: nil)
                    NutritionStatStack(title: "Carbs", value: appetizer.carbs, unit: "g")
                    NutritionStatStack(title: "Protien", value: appetizer.protein, unit: "g")
                }
            }
            
            Spacer()
            
            Button(action: {
                order.add(appetizer)
                viewModel.selectedAppetizer = nil
            }, label: {
                PrimaryButtonView(label: "\(appetizer.price.asCurrency) - Add to Order")
            })
            .padding(.bottom, 30)
        }
        .frame(width: 300, height: 525)
        .background(Color(.systemBackground))
        .clipShape(RoundedRectangle(cornerRadius: 12))
        .shadow(color: .primary, radius: 40)
        .overlay(alignment: .topTrailing) {
            Button(action: {
                viewModel.selectedAppetizer = nil
            }, label: {
                XDismissButton()
                    .padding(2)
            })
        }
    }
}

#Preview {
    AppetizerDetailsView(viewModel: MockData.detailViewModel)
}
