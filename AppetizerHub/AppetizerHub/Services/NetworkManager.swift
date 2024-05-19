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
    
    // MARK: - Completion Handler version (approach in tutorial)
    func getAppetizers(completed: @escaping (Result<[Appetizer], APError>) -> ()) {
        let appetizerEndpoint = NetworkManager.baseUrl + "appetizers"
        
        guard let url = URL(string: appetizerEndpoint) else {
            completed(.failure(.invalidUrl))
            return
        }
        
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, response, error in
            guard error == nil else {
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
                
                completed(.success(decodedRespone.request))
            } catch {
                completed(.failure(.invalidData))
            }
        }
        
        task.resume()
    }
    
    // MARK: Async / Await call (my challenge addition)
    func getAppetizers() async -> Result<[Appetizer], APError> {
        let appetizerEndpoint = NetworkManager.baseUrl + "appetizers"
        
        guard let url = URL(string: appetizerEndpoint) else { return .failure(.invalidUrl) }
        guard let (data, response) = try? await URLSession.shared.data(from: url) else { return .failure(.unableToComplete) }
        guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else { return .failure(.invalidResponse) }
        
        let decoder = JSONDecoder()
        guard let decodedResponse = try? decoder.decode(AppetizerResponse.self, from: data) else { return .failure(.invalidData) }
        
        return .success(decodedResponse.request)
    }
}
