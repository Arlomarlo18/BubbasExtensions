//
//  File.swift
//
//
//  Created by Bubba hall on 9/21/22.
//

import Foundation
import SwiftUI

@available(macOS 10.15, *)
@available(iOS 13.0, *)
extension View {
    
    /// This functions allows a print statement to be used as a view.
    ///
    /// You can use this is SwiftUI and can print a statment in a view.
    ///
    /// ```
    /// VStack {
    ///     printInView("Test")
    /// }
    /// ```
    ///
    /// - Parameter vars: Anything that can be put into a print function
    /// - Warning: Should not use this unless there is a very specific reasoning.
    public func printInView(_ vars: Any...) -> some View {
        for v in vars { print(v) }
        return EmptyView()
    }
}
