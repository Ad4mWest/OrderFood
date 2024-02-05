//  OrderFoodListCell.swift
//  OrderFood
//  Created by Adam West on 11.01.2024.

import SwiftUI

struct OrderFoodListCell: View {
    // MARK: Public Properties
    var order: OrderFood
    
    // MARK: Lifecycle
    var body: some View {
        HStack(spacing: 20) {
            AsyncImage(
                url: URL(string: order.imageURL)
            ) { image in
                image
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 120, height: 90)
                    .cornerRadius(8)
            } placeholder: {
                Image("food-placeholder")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 120, height: 90)
                    .cornerRadius(8)
            }
            VStack(alignment: .leading, spacing: 5) {
                Text(order.name)
                    .font(.title2)
                    .fontWeight(.medium)
                Text("$\(order.price, specifier: "%.2f")")
                .foregroundStyle(.gray)
                .fontWeight(.semibold)
            }
            .padding(.leading)
        }
    }
}

#Preview {
    OrderFoodListCell(order: MockData.sampleOrderFood)
}
