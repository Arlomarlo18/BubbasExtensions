//
//  NetworkManager.swift
//  
//
//  Created by Bubba Hall on 9/14/23.
//

import Foundation

@available(iOS 15.0, *)
public struct NetworkManager {
    
    public init() {}
    
   public func fetch<T: Codable>(from urlString: String, results: inout T) async throws {
        
        guard let url = URL(string: urlString) else {
            throw URLError(.badURL)
        }
        let (data, response) = try await URLSession.shared.data(from: url)
        guard (response as? HTTPURLResponse)?.statusCode == 200 else {
            throw URLError(.badServerResponse)
        }
        let result = try JSONDecoder().decode(T.self, from: data)
        results = result
    }
}

