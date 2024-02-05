//  NutritionInfoView.swift
//  OrderFood
//  Created by Adam West on 05.02.2024.

import SwiftUI

struct NutritionInfoView: View {
    // MARK: Public Properties
    let title: String
    let text: String
    
    // MARK: Lifecycle
    var body: some View {
        VStack(spacing: 5) {
            Text(title)
                .bold()
                .font(.caption)
            Text(text)
                .foregroundStyle(.secondary)
                .fontWeight(.semibold)
                .italic()
        }
    }
}

