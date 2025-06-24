//
//  FontUtils.swift
//
//
//  Created by Bubba Hall on 11/8/23.
//

import Foundation
import SwiftUI

#if canImport(UIKit)
import UIKit

public class FontUtils {
    /// This static function will print all of the fonts that your project has access to.
    ///
    /// If you add a custom font you can call this function and see if it is actually in your project or not.
    ///
    /// ```
    /// FontUtils.printSystemFonts()
    /// ```
    public static func printSystemFonts() {
        for familyName in UIFont.familyNames {
            print(familyName)
            for fontName in UIFont.fontNames(forFamilyName: familyName) {
                print("-- \(fontName)")
            }
        }
    }
}
#endif
