//
//  NetworkManager.swift
//  Appotizers
//
//  Created by Adam West on 11.01.2024.
//

import UIKit
import Combine

final class NetworkManager {
    static let shared = NetworkManager()
    private let cache = NSCache<NSString, UIImage>()
    
    static let baseURL = "https://seanallen-course-backend.herokuapp.com/swiftui-fundamentals/"
    private let appetizerURL = baseURL + "appetizers"
    
    
    private init() {}
    
    func getAppetizers(completed: @escaping (Result<[Appetizer], APError>) -> Void) {
        guard let url = URL(string: appetizerURL) else {
            completed(.failure(APError.invalidURL))
            return
        }
        
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, response, error in
            if let _ = error {
                completed(.failure(APError.unableToComplete))
                return
            }
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                completed(.failure(APError.invalidResponse))
                return
            }
            guard let data = data else {
                completed(.failure(APError.invalidData))
                return
            }
            
            do {
                let decoder = JSONDecoder()
                let decodedResponse = try decoder.decode(AppetizerResponse.self, from: data)
                completed(.success(decodedResponse.request))
            } catch {
                completed(.failure(APError.invalidData))
            }
        }
        
        task.resume()
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
        
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, response, error in
            guard let data = data, let image = UIImage(data: data) else {
                completed(nil)
                return
            }
            
            self.cache.setObject(image, forKey: cacheKey)
            completed(image)
        }
        task.resume()
    }
}

//var storage = Set<AnyCancellable>()


//let task = URLSession.shared.dataTaskPublisher(for: URLRequest(url: url))
//   
//task
//    .map(\.data)
//    .decode(type: Appetizer.self, decoder: JSONDecoder())
//    .receive(on: DispatchQueue.main)
//    .sink { completion in
//        switch completion {
//        case .finished:
//            print(completion)
//        case .failure(let error):
//            assertionFailure(error.localizedDescription)
//        }
//    } receiveValue: { print($0) }
//    .store(in: &storage)
