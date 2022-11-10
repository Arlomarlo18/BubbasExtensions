//
//  File.swift
//  
//
//  Created by Bubba hall on 10/19/22.
//

import Foundation

@available(iOS 13.0, *)

/// This class lets me find my path to where my SQLite file is located so I can put it in the DBBrowser
public class DatabaseUtils {
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
