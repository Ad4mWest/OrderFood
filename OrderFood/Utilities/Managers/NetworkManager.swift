//  NetworkManager.swift
//  OrderFood
//  Created by Adam West on 11.01.2024.

import UIKit

final class NetworkManager {
    // MARK: Public Properties
    static let shared = NetworkManager()
    static let baseURL = "https://seanallen-course-backend.herokuapp.com/swiftui-fundamentals/"
    
    // MARK: Private properties
    private let cache = NSCache<NSString, UIImage>()
    private let orderFoodURL = baseURL + "appetizers"
    
    // MARK: Initialization
    private init() {}
    
    // MARK: Public methods
    func getOrderFoods() async throws -> [OrderFood] {
        guard let url = URL(string: orderFoodURL) else {
            throw APError.invalidURL
        }
        let (data, _) = try await URLSession.shared.data(from: url)
        
        do {
            let decoder = JSONDecoder()
            return try decoder.decode(OrderFoodResponse.self, from: data).request
        } catch {
            throw APError.invalidData
        }
    }
    
    func downloadImage(fromURLString urlString: String, completed: @escaping(UIImage?) -> Void) {
        let cacheKey = NSString(string: urlString)
        
        if let image = cache.object(forKey: cacheKey) {
            completed(image)
            return
        }
        
        guard let url = URL(string: urlString) else {
            completed(nil)
            return
        }
        
        let task = URLSession.shared.dataTask(
            with: URLRequest(url: url)
        ) { data, response, error in
            guard let data, let image = UIImage(data: data) else {
                completed(nil)
                return
            }
            
            self.cache.setObject(image, forKey: cacheKey)
            completed(image)
        }
        task.resume()
    }
}

