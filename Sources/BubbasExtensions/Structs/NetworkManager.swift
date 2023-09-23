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
    
    /// This is a funcion that can fetch from any url string
    ///
    /// With this function you can put any url string in and put the results in the results parameter with a inout.
    ///
    /// ```
    /// NetworkManager().fetch(from: "https://restcountries.com/v2/all", results &countries)
    /// ```
    ///
    /// - Parameter urlString: A URL String going to a JSON file on the internet.
    /// - Parameter results: The variable that you want to store your results in.
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

