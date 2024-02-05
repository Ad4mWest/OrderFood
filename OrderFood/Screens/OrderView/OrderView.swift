//  OrderView.swift
//  OrderFood
//  Created by Adam West on 11.01.2024.

import SwiftUI

struct OrderView: View {
    // MARK: Public Properties
    @EnvironmentObject var order: Order
    
    // MARK: Lifecycle
    var body: some View {
        NavigationView {
            ZStack {
                VStack {
                    List {
                        ForEach(order.items) {
                            OrderFoodListCell(order: $0)
                        }
                        .onDelete(perform: {
                            order.deleteItems(at: $0)
                        })
                    }
                    .listStyle(PlainListStyle())
                    Button("$\(order.totalPrice, specifier: "%.2f") - Pay") {
                        print("Payed")
                    }
                    .modifier(StandartButtonStyle())
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
