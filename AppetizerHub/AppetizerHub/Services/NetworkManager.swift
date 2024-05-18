//
//  NetworkManager.swift
//  AppetizerHub
//
//  Created by Jeffrey Sweeney on 5/18/24.
//

import Foundation

final class NetworkManager {
    static let shared = NetworkManager()
    static let baseUrl = "https://seanallen-course-backend.herokuapp.com/swiftui-fundamentals/"
    
    private init() { }
    
    func getAppetizers(completed: @escaping (Result<[Appetizer], APError>) -> ()) {
        let appetizerEndpoint = NetworkManager.baseUrl + "appetizers"
        
        guard let url = URL(string: appetizerEndpoint) else {
            completed(.failure(.invalidUrl))
            return
        }
        
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, response, error in
            guard let error else {
                completed(.failure(.unableToComplete))
                return
            }
            
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                completed(.failure(.invalidResponse))
                return
            }
            
            guard let data else {
                completed(.failure(.invalidData))
                return
            }
            
            do {
                let decoder = JSONDecoder()
                let decodedRespone = try decoder.decode(AppetizerResponse.self, from: data)
                
                completed(.success(decodedRespone.response))
            } catch {
                completed(.failure(.invalidData))
            }
        }
        
        task.resume()
    }
}
