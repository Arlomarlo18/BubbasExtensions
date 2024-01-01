//
//  StrngPlusAbbrivated.swift
//
//
//  Created by Bubba Hall on 12/31/23.
//

import Foundation

extension String {
    public func abbreviate() -> String {
        let words = self.components(separatedBy: " ")
        let capitalizedWords = words.map { $0.capitalized }
        return capitalizedWords.joined(separator: " ")
    }
}
