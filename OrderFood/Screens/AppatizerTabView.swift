//  ContentView.swift
//  OrderFood
//  Created by Adam West on 11.01.2024.

import SwiftUI

struct AppatizerTabView: View {
    // MARK: Public Properties
    @EnvironmentObject var order: Order
    
    // MARK: Lifecycle
    var body: some View {
        TabView {
            OrderFoodListView()
                .tabItem {
                    Label("Home", systemImage: "house")
                }
            AccountView()
                .tabItem {
                    Label("Account", systemImage: "person")
                }
            OrderView()
                .tabItem {
                    Label("Order", systemImage: "bag")
                }
                .badge(order.items.count)
        }
        .tint(Color.brandP)
    }
}

#Preview {
    AppatizerTabView()
}
