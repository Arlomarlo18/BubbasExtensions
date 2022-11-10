//
//  File.swift
//  
//
//  Created by Bubba hall on 9/21/22.
//

import Foundation
import SwiftUI

@available(iOS 13.0, *)
/// Extends View so it can take a print function for debugging purposes
extension View {
   public func printInView(_ vars: Any...) -> some View {
        for v in vars { print(v) }
        return EmptyView()
    }
}
