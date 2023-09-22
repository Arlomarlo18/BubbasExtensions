//
//  File.swift
//  
//
//  Created by Bubba Hall on 10/31/22.
//

import Foundation
import SwiftUI

@available(iOS 13.0, *)


extension Shape {
    /// This Extends Shape so you can do a fill and a stroke on the same shape
    ///
    /// Fill and Stroke cannot be called on the same shape, so this function will allow you to have both on any shape that is a view.
    /// ```
    /// RoundedRectangle()
    ///     .fillAndStroke(fill: Color.red, strokeColor: Color.black, strokeWidth: 3)
    /// ```
    /// - Parameter fill: What do you want the shape to be filled with
    /// - Parameter strokeColor: What do you want the color of the stroke around the shape to be.
    /// - Parameter strokeWidth: How wide do you want the stoke to be.
    /// - Returns: some View 
    public func fillAndStroke(fill fillContent: some ShapeStyle, strokeColor: some ShapeStyle, strokeWidth: CGFloat) -> some View {
        self
            .stroke(strokeColor, lineWidth: strokeWidth)
            .background(fill(fillContent))
    }
}
