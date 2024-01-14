//
//  AppetizersApp.swift
//  Appetizers
//
//  Created by Sean Allen on 11/8/20.
//

import SwiftUI

@main
struct AppetizersApp: App {
    
    var order = Order()
    
    var body: some Scene {
        WindowGroup {
            AppetizerTabView().environmentObject(order)
        }
    }
}
