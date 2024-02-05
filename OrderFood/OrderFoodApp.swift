//  OrderFoodApp.swift
//  OrderFood
//  Created by Adam West on 12.01.2024.

import SwiftUI

@main
struct OrderFoodApp: App {
    // MARK: Public Properties
    var order = Order()
    
    // MARK: Lifecycle
    var body: some Scene {
        WindowGroup {
            AppatizerTabView().environmentObject(order)
        }
    }
}
