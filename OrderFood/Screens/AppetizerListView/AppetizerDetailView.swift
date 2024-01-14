//
//  AppetizerDetailView.swift
//  OrderFood
//
//  Created by Adam West on 12.01.2024.
//

import SwiftUI

struct AppetizerDetailView: View {
    let appetizer: Appetizer
    @Binding var isShowingDetails: Bool
    
    var body: some View {
        VStack {
            AppetizerRemoteImage(urlString: appetizer.imageURL)
                .frame(width: 300, height: 225)
            VStack {
                Text(appetizer.name)
                    .font(.title2)
                    .fontWeight(.semibold)
                Text(appetizer.description)
                    .multilineTextAlignment(.center)
                    .font(.body)
                    .padding()
                HStack(spacing: 40) {
                    NutritionInfo(title: "Calories",
                                  text: "\(appetizer.calories) g")
                    NutritionInfo(title: "Carbs",
                                  text: "\(appetizer.carbs) g")
                    NutritionInfo(title: "Protein",
                                  text: "\(appetizer.protein) g")
                }
            }
            Spacer()
            
            Button {
                print("tapped")
            } label: {
                APButton(text: "$\(appetizer.price, specifier: "%.2f") - Add to Order")
            }
            .padding(.bottom, 30)
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
    AppetizerDetailView(appetizer: MockData.sampleAppetizer, isShowingDetails: .constant(true))
}

struct NutritionInfo: View {
    let title: String
    let text: String
    
    var body: some View {
        VStack(spacing: 5) {
            Text(title)
                .bold()
                .font(.caption)
            Text(text)
                .foregroundStyle(.secondary)
                .fontWeight(.semibold)
                .italic()
        }
    }
}
