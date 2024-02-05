//  OrderFoodListView.swift
//  OrderFood
//  Created by Adam West on 11.01.2024.

import SwiftUI

struct OrderFoodListView: View {
    // MARK: Public Properties
    @StateObject var viewModel = OrderFoodListViewModel()
    
    // MARK: Lifecycle
    var body: some View {
        ZStack {
            NavigationView {
                List(viewModel.orderFoods) { orderFood in
                    OrderFoodListCell(order: orderFood)
                        .onTapGesture {
                            viewModel.isShowingDetail = true
                            viewModel.selectedOrderFood = orderFood
                        }
                }
                .listStyle(.plain)
                .navigationTitle("🐲 Choose your dish")
                .disabled(viewModel.isShowingDetail)
            }
            .blur(radius: viewModel.isShowingDetail ? 20 : 0)
            .task {
                viewModel.getOrderFoods()
            }
            if viewModel.isShowingDetail {
                if let selectedOrderFood = viewModel.selectedOrderFood {
                    OrderFoodDetailView(
                        orderFood: selectedOrderFood,
                        isShowingDetails: $viewModel.isShowingDetail
                    )
                }
            }
            if viewModel.isLoading {
                LoadingView()
            }
        }
        .alert(item: $viewModel.alertItem) {
            Alert(
                title: $0.title,
                message: $0.message,
                dismissButton: $0.dismissButton)
        }
    }
}

#Preview {
    OrderFoodListView()
}
