//
//  File.swift
//  
//
//  Created by Bubba hall on 10/19/22.
//

import Foundation

@available(iOS 13.0, *)
class DatabaseUtils {
    public static func whereIsMySQLite() {
        let path = FileManager
            .default
            .urls(for: .applicationSupportDirectory, in: .userDomainMask)
            .last?
            .absoluteString
            .replacingOccurrences(of: "file://", with: "")
            .removingPercentEncoding
        
        print("SQLite File: ")
        print(path ?? "Not found")
    }
}
