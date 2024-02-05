//  OrderFoodRemoteImage.swift
//  OrderFood
//  Created by Adam West on 12.01.2024.

import SwiftUI

final class ImageLoader: ObservableObject {
    // MARK: Public Properties
    @Published var image: Image? = nil
    
    // MARK: Public methods
    func load(fromURLString urlString: String) {
        NetworkManager.shared.downloadImage(fromURLString: urlString) { uiImage in
            guard let uiImage else { return }
            DispatchQueue.main.async {
                self.image = Image(uiImage: uiImage)
            }
        }
    }
}

// MARK: - Container view for placeholder
struct RemoteImage: View {
    // MARK: Public Properties
    var image: Image?
    
    // MARK: Lifecycle
    var body: some View {
        image?.resizable() ?? Image("food-placeholder").resizable()
    }
}

// MARK: - Remote Image
struct OrderFoodRemoteImage: View {
    // MARK: Public Properties
    @StateObject var imageLoader = ImageLoader()
    let urlString: String
    
    // MARK: Lifecycle
    var body: some View {
        RemoteImage(image: imageLoader.image)
            .onAppear {
                imageLoader.load(fromURLString: urlString)
            }
    }
}
