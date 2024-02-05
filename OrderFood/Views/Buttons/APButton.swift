//  APButton.swift
//  OrderFood
//  Created by Adam West on 13.01.2024.

import SwiftUI

struct APButton: View {
    // MARK: Public Properties
    let text: LocalizedStringKey
    
    // MARK: Lifecycle
    var body: some View {
        Text(text)
            .font(.title3)
            .fontWeight(.semibold)
            .frame(width: 260, height: 50)
            .foregroundColor(.white)
            .background(Color.brandP)
            .cornerRadius(10)
    }
}

#Preview {
    APButton(
        text: LocalizedStringKey("One")
    )
}
