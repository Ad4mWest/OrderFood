//  OrderFoodListViewModel.swift
//  OrderFood
//  Created by Adam West on 11.01.2024.

import Foundation

@MainActor final class OrderFoodListViewModel: ObservableObject {
    // MARK: Public Properties
    @Published var orderFoods: [OrderFood] = []
    @Published var alertItem: AlertItem?
    @Published var isLoading = false
    @Published var isShowingDetail = false
    @Published var selectedOrderFood: OrderFood?
    
    // MARK: Public methods
    func getOrderFoods() {
        isLoading = true
        Task {
            do {
                orderFoods = try await NetworkManager.shared.getOrderFoods()
            } catch {
                if let apError = error as? APError {
                    switch apError {
                    case .invalidURL:
                        alertItem = AlertContext.invalidURL
                    case .invalidResponse:
                        alertItem = AlertContext.invalidResponse
                    case .invalidData:
                        alertItem = AlertContext.invalidData
                    case .unableToComplete:
                        alertItem = AlertContext.unableToComplete
                    }
                } else {
                    alertItem = AlertContext.invalidResponse
                }
            }
            isLoading = false
        }
    }
}
