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
