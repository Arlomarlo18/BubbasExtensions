//
//  File.swift
//  
//
//  Created by Bubba hall on 10/19/22.
//

import Foundation

@available(iOS 13.0, *)

/// This class is used for all functions that help with databases
public class DatabaseUtils {
    
    /// This function finds the path to where the SQLite file is located
    ///
    /// This function prints in the consol the path to your SQLite file in your finder. If you paste this path into the DB Browser Application you can see your database inside of that application.
    /// ```
    /// DatabaseUtils().whereIsMySQLite
    /// ```
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
