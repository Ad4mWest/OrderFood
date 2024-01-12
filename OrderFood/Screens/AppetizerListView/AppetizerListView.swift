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
                    AppetizerListCell(appatizer: appatizer)
                }
                .navigationTitle("🐲 Appetizers")
            }
            .onAppear { // вызовем метод при появлении экрана
                viewModel.getAppetizers()
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
