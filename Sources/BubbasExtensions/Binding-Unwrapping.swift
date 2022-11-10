//
//  File.swift
//  
//
//  Created by Bubba hall on 10/21/22.
//

import Foundation
import SwiftUI

@available(iOS 13.0, *)


/// Extends Binding to be able to unwrap a optional binding with any generic type
///
/// Use on a Binding<T>?
///
/// Returns the Binding<T>
extension Binding {
     public func toUnwrapped<T>(defaultValue: T) -> Binding<T> where Value == Optional<T>  {
        Binding<T>(get: { self.wrappedValue ?? defaultValue }, set: { self.wrappedValue = $0 })
    }
}

