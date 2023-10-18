//
//  NetworkManager.swift
//  Appetizers
//
//  Created by João Pedro Soares on 03/10/2023.
//

import UIKit

final class NetworkManager {
    
    static let shared = NetworkManager()
    private let cache = NSCache<NSString, UIImage>()
    
    static let baseURL = "https://seanallen-course-backend.herokuapp.com/swiftui-fundamentals"
    private let appetizersURL = baseURL + "/appetizers"
    
    private init() {}
    
    func getAppetizers() async throws -> [Appetizer] {
        
        guard let url = URL(string: appetizersURL) else {
            throw APError.invalidURL
        }
        
        let (data, _) = try await URLSession.shared.data(from: url)
        
        do {
            let decoder = JSONDecoder()
            return try decoder.decode(AppetizerResponse.self, from: data).request
        } catch _ {
            throw APError.invalidData
        }
        
    }
    
    func downloadImage(fromURLString urlString: String, completed: @escaping (UIImage?) -> ()) {
        let cacheKey = NSString(string: urlString)
        if let image = cache.object(forKey: cacheKey){
            completed(image)
            return
        }
        
        guard let url = URL(string: urlString) else {
            completed(nil)
            return
        }
        
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, response, _ in
            guard
                let data,
                let image = UIImage(data: data)
            else {
                completed(nil)
                return
            }
            self.cache.setObject(image, forKey: cacheKey)
            completed(image)
        }
        
        task.resume()
    }
}
