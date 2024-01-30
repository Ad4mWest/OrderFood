//  OrderView.swift
//  Cards
//  Created by Adam West on 11.01.2024.

import SwiftUI

struct OrderView: View {
    @EnvironmentObject var order: Order
    
    var body: some View {
        NavigationView {
            ZStack {
                VStack {
                    List {
                        ForEach(order.items) {  appetizer in
                            AppetizerListCell(appetizer: appetizer)
                        }
                        .onDelete(perform: {
                            order.deleteItems(at: $0)
                        })
                    }
                    .listStyle(PlainListStyle())
                    Button {
                        print("Pressed")
                    } label: {
                        APButton(text: "$\(order.totalPrice, specifier: "%.2f") - Place Order")
                    }
                    .padding(.bottom, 25)
                }
                if order.items.isEmpty {
                    EmptyState(
                        imageName: "empty-order",
                        message: "You have no items in your order."
                    )
                }
            }
            .navigationTitle("🐗 Orders")
        }
    }
}

#Preview {
    OrderView()
}
