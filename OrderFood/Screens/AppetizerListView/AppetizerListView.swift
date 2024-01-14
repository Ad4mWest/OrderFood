//
//  AppetizerListView.swift
//  Cards
//
//  Created by Adam West on 11.01.2024.
//

import SwiftUI

struct AppetizerListView: View {
    @StateObject var viewModel = AppetizerListViewModel()
    
    var body: some View {
        ZStack {
            NavigationView {
                List(viewModel.appetizers) { appatizer in
                    AppetizerListCell(appetizer: appatizer)
                        .onTapGesture {
                            viewModel.isShowingDetail = true
                            viewModel.selectedAppetizer = appatizer
                        }
                }
                .navigationTitle("🐲 Choose your dish")
                .disabled(viewModel.isShowingDetail)
            }
            .blur(radius: viewModel.isShowingDetail ? 20 : 0)
            
            .onAppear { 
                viewModel.getAppetizers()
            }
            
            if viewModel.isShowingDetail {
                if let selectedAppetizer = viewModel.selectedAppetizer {
                    AppetizerDetailView(appetizer: selectedAppetizer, isShowingDetails: $viewModel.isShowingDetail)
                }
            }
            
            if viewModel.isLoading {
                LoadingView()
            }
        }
            .alert(item: $viewModel.alertItem) { alertItem in
                Alert(
                    title: alertItem.title,
                    message: alertItem.message,
                    dismissButton: alertItem.dismissButton)
            }
    }
    
    
}

#Preview {
    AppetizerListView()
}
