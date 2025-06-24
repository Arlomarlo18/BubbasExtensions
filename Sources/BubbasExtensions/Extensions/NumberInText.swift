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
extension Text {
    
    /// Extends Text so that It can accept a Int as a parameter.
    /// ```
    /// Text(12)
    /// ```
    /// - Parameter int: Any Integer can go in text
    public init(_ int: Int) {
        self.init("\(int)")
    }
    
    /// Extends Text so that It can accept a Double as a parameter
    /// ```
    /// Text(12.12)
    /// ```
    /// - Parameter double: Any Double can go in text
    public init(_ double: Double) {
        self.init("\(double)")
    }
    
    /// Extends Text so that It can accept a Float as a parameter
    /// ```
    /// Text(CGFoat(12.12))
    /// ```
    /// - Parameter float: Any CGFloat can go in text
    public init(_ float: CGFloat) {
        self.init("\(float)")
    }
    
    /// Extends Text so that It can accept a Int16 as a parameter
    /// ```
    /// Text(Int16(12))
    /// ```
    /// - Parameter int16: Any Int16 can go in text
    public init(_ int16: Int16) {
        self.init("\(int16)")
    }
    
    /// Extends Text so that It can accept a Int32 as a parameter
    /// ```
    /// Text(Int32(12))
    /// ```
    /// - Parameter int32: Any Int32 can go in text
    public init(_ int32: Int32) {
        self.init("\(int32)")
    }
    
    /// Extends Text so that It can accept a Int64 as a parameter
    /// ```
    /// Text(Int64(12))
    /// ```
    /// - Parameter int64: Any Int64 can go in text
    public init(_ int64: Int64) {
        self.init("\(int64)")
    }
}
