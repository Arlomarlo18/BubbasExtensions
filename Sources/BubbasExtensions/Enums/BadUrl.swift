//
//  File.swift
//  
//
//  Created by Bubba Hall on 11/16/23.
//

import Foundation
public enum BadUrlError: Error {
    case requestFailed(reason: String)
    case invalidResponse
    case decodingFailed
}
