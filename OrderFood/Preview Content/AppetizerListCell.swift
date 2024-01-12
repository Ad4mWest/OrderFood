//
//  AppetizerListCell.swift
//  Appotizers
//
//  Created by Adam West on 11.01.2024.
//

import SwiftUI

struct AppetizerListCell: View {
    var appatizer: Appetizer
    
    var body: some View {
        HStack(spacing: 20) {
            AppetizerRemoteImage(urlString: appatizer.imageURL)
                .aspectRatio(contentMode: .fit)
                .frame(width: 120, height: 90)
                .cornerRadius(8)
            
            VStack(alignment: .leading, spacing: 5) {
                Text(appatizer.name)
                    .font(.title2)
                    .fontWeight(.medium)
                Text("$\(appatizer.price, specifier: "%.2f")")
                    .foregroundStyle(.gray)
                    .fontWeight(.semibold)
            }
            .padding(.leading)
        }
    }
}

#Preview {
    AppetizerListCell(appatizer: MockData.sampleAppetizer)
}
