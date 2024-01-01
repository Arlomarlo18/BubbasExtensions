//
//  StrngPlusAbbreviated.swift
//
//
//  Created by Bubba Hall on 12/31/23.
//

import Foundation

extension String {
    
    /// This function is called on a string and abbreviates it and returns the first letter of every word and capitalizes it.
    ///
    /// This is used to shorten the name of objects,
    /// ```
    /// var footballTeamName = "Green Bay Packers"
    /// var code = footballTeamName.abbreviate()
    /// print(code) // "GBP
    /// ```
    ///  - Returns: An Abbreviated Code.
    public func abbreviate() -> String {
        let words = self.components(separatedBy: " ")
        let abbreviatedWords = words.map { $0.prefix(1).capitalized }
        return abbreviatedWords.joined()
    }
}
