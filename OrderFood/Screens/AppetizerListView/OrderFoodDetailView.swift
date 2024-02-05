//  OrderFoodDetailView.swift
//  OrderFood
//  Created by Adam West on 12.01.2024.

import SwiftUI

struct OrderFoodDetailView: View {
    // MARK: Public Properties
    let orderFood: OrderFood
    @Binding var isShowingDetails: Bool
    @EnvironmentObject var order: Order
    
    // MARK: Lifecycle
    var body: some View {
        VStack {
            OrderFoodRemoteImage(urlString: orderFood.imageURL)
                .frame(width: 300, height: 225)
            VStack {
                Text(orderFood.name)
                    .font(.title2)
                    .fontWeight(.semibold)
                Text(orderFood.description)
                    .multilineTextAlignment(.center)
                    .font(.body)
                    .padding()
                HStack(spacing: 40) {
                    NutritionInfoView(
                        title: "Calories",
                        text: "\(orderFood.calories) g"
                    )
                    NutritionInfoView(
                        title: "Carbs",
                        text: "\(orderFood.carbs) g"
                    )
                    NutritionInfoView(
                        title: "Protein",
                        text: "\(orderFood.protein) g"
                    )
                }
            }
            Spacer()
            Button {
                order.add(orderFood)
                isShowingDetails = false
            } label: {
                Text("$\(orderFood.price, specifier: "%.2f") - Add to Order")
            }
            .modifier(StandartButtonStyle())
        }
        .frame(width: 300, height: 525)
        .background(Color(.systemBackground))
        .cornerRadius(12)
        .shadow(radius: 40)
        .overlay(alignment: .topTrailing) {
            Button {
                isShowingDetails = false
            } label: {
                XDismissButton()
            }
        }
    }
}

#Preview {
    OrderFoodDetailView(
        orderFood: MockData.sampleOrderFood,
        isShowingDetails: .constant(true)
    )
}
