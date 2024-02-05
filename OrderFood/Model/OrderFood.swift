//  OrderFood.swift
//  OrderFood
//  Created by Adam West on 11.01.2024.

import Foundation

struct OrderFood: Decodable, Identifiable {
    let id: Int
    let name: String
    let description: String
    let price: Double
    let imageURL: String
    let calories: Int
    let protein: Int
    let carbs: Int
}

// MARK: - Response
struct OrderFoodResponse: Decodable {
    let request: [OrderFood]
}

// MARK: - MockData
struct MockData {
    static let sampleOrderFood = OrderFood(
        id: 0001,
        name: "Test Order",
        description: "This is a decription",
        price: 9.99,
        imageURL: "",
        calories: 350,
        protein: 20,
        carbs: 60)
    
    static let sampleOrderFoodTwo = OrderFood(
        id: 0001,
        name: "Test Order",
        description: "This is a decription",
        price: 9.99,
        imageURL: "",
        calories: 350,
        protein: 20,
        carbs: 60)
    
    static let sampleOrderFoodThree = OrderFood(
        id: 0001,
        name: "Test Order",
        description: "This is a decription",
        price: 9.99,
        imageURL: "",
        calories: 350,
        protein: 20,
        carbs: 60)
    
    static let orderFoods = [
        sampleOrderFood,
        sampleOrderFoodTwo,
        sampleOrderFoodThree
    ]
}
