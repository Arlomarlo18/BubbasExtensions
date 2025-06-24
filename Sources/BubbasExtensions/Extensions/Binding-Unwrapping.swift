//
//  File.swift
//  
//
//  Created by Bubba hall on 10/21/22.
//

import Foundation
import SwiftUI

@available(macOS 10.15, *)
@available(iOS 13.0, *)


/// Extends Binding to be able to unwrap a optional binding with any generic type
///
/// Use on a Binding<T>?
///
/// Returns the Binding<T>
extension Binding {
    
    /// This function extends Binding Optionals to help unwrapping them.
    ///
    /// This is a generic function that can be used on any custom, basic, or complex type.
    ///
    /// ```
    /// $collection.name.toUnwrapped(defaultValue: "Error")
    /// ```
    /// - Warning: You should not have Binding Optionals. For the rare case you do this makes life easier.
    /// - Parameter defaultValue: This is when the Binding Optional is nil.
    /// - Returns: This will return either the wrapped value or the default value.
    public func toUnwrapped<T>(defaultValue: T) -> Binding<T> where Value == Optional<T>  {
        Binding<T>(get: { self.wrappedValue ?? defaultValue }, set: { self.wrappedValue = $0 })
    }
}

