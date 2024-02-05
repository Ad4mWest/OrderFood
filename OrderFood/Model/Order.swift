//  Order.swift
//  OrderFood
//  Created by Adam West on 24.01.2024.

import SwiftUI

final class Order: ObservableObject {
    // MARK: Public Properties
    @Published var items: [OrderFood] = []
    var totalPrice: Double {
        items.reduce(0) { $0 + $1.price }
    }
    
    // MARK: Public methods
    func add(_ order: OrderFood) {
        items.append(order)
    }
    
    func deleteItems(at offsets: IndexSet) {
        items.remove(atOffsets: offsets)
    }
}
