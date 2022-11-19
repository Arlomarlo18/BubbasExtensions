//
//  File.swift
//  
//
//  Created by Bubba hall on 9/21/22.
//

import Foundation
import SwiftUI

@available(iOS 13.0, *)
/// Extends Text so that it can take a INT, DOUBLE, AND CGFLOAT
extension Text {
    public init(_ int: Int) {
        self.init("\(int)")
    }
    public init(_ double: Double) {
        self.init("\(double)")
    }
    public init(_ float: CGFloat) {
        self.init("\(float)")
    }
}
