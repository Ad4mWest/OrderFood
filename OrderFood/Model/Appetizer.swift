//  Appetizer.swift
//  Cards
//  Created by Adam West on 11.01.2024.

import Foundation

struct Appetizer: Decodable, Identifiable {
    let id: Int
    let name: String
    let description: String
    let price: Double
    let imageURL: String
    let calories: Int
    let protein: Int
    let carbs: Int
}

struct AppetizerResponse: Decodable {
    let request: [Appetizer]
}

struct MockData {
    static let sampleAppetizer = Appetizer(
        id: 0001,
        name: "Test Appetizer",
        description: "This is a decription",
        price: 9.99,
        imageURL: "",
        calories: 350,
        protein: 20,
        carbs: 60)
    
    static let sampleAppetizerTwo = Appetizer(
        id: 0001,
        name: "Test Appetizer",
        description: "This is a decription",
        price: 9.99,
        imageURL: "",
        calories: 350,
        protein: 20,
        carbs: 60)
    
    static let sampleAppetizerThree = Appetizer(
        id: 0001,
        name: "Test Appetizer",
        description: "This is a decription",
        price: 9.99,
        imageURL: "",
        calories: 350,
        protein: 20,
        carbs: 60)
    
    static let appetizers = [sampleAppetizer,sampleAppetizerTwo,sampleAppetizerThree]
}
