//  ContentView.swift
//  Appotizers
//  Created by Adam West on 11.01.2024.

import SwiftUI

struct AppatizerTabView: View {
    var body: some View {
        TabView {
            AppetizerListView()
                .tabItem {
                    Image(systemName: "house")
                    Text("Home")
                }
            AccountView()
                .tabItem {
                    Image(systemName: "person")
                    Text("Account")
                }
            OrderView()
                .tabItem {
                    Image(systemName: "bag")
                    Text("Order")
                }
        }
        .tint(Color.brandP) 
    }
}

#Preview {
    AppatizerTabView()
}
