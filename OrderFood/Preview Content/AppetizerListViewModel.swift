//
//  AppetizerListViewModel.swift
//  Appotizers
//
//  Created by Adam West on 11.01.2024.
//

import Foundation

final class AppetizerListViewModel: ObservableObject {
    @Published var appetizers: [Appetizer] = []
    @Published var alertItem: AlertItem?
    @Published var isLoading = false 
    
    func getAppetizers() {
        isLoading = true 
        NetworkManager.shared.getAppetizers { [self] result in
            DispatchQueue.main.async {
                self.isLoading = false
                switch result {
                case .success(let appotizers):
                    self.appetizers = appotizers
                case .failure(let error):
                    switch error {
                    case .invalidResponse:
                        self.alertItem = AlertContext.invalidResponse
                    case .invalidURL:
                        self.alertItem = AlertContext.invalidURL
                    case .invalidData:
                        self.alertItem = AlertContext.invalidData
                    case .unableToComplete:
                        self.alertItem = AlertContext.unableToComplete
                    }
                }
            }
        }
    }
}
