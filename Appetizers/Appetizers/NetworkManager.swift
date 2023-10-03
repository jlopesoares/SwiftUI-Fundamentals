//
//  NetworkManager.swift
//  Appetizers
//
//  Created by João Pedro Soares on 03/10/2023.
//

import Foundation

final class NetworkManager {
    
    static let shared = NetworkManager()
    
    static let baseURL = "https://seanallen-course-backend.herokuapp.com/swiftui-fundamentals"
    private let appetizersURL = baseURL + "/appetizers"
    
    private init() {}
    
    func getAppetizers(completed: @escaping (Result<[Appetizer], APError>) -> Void) {
        
        guard let url = URL(string: appetizersURL) else {
            completed(.failure(APError.invalidURL))
            return
        }
        
        URLSession.shared.dataTask(with: URLRequest(url: url)) { data, response, error in
            if let _ = error {
                completed(.failure(.unableToComplete))
                return
            }
            
            guard
                let response = response as? HTTPURLResponse,
                response.statusCode == 200
            else {
                completed(.failure(.invalidResponse))
                return
            }
            
            guard let data = data else {
                completed(.failure(.invalidData))
                return
            }
            
            do {
                let decoder = JSONDecoder()
                let decodedResponse = try decoder.decode(AppetizerResponse.self, from: data)
                
                completed(.success(decodedResponse.request))
            } catch _ {
                completed(.failure(.invalidData))
            }
        }.resume()
    }
}
