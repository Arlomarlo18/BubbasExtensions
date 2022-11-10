//
//  File.swift
//  
//
//  Created by Bubba Hall on 10/31/22.
//

import Foundation
import SwiftUI

@available(iOS 13.0, *)

/// Extends Shape so you can do a fill and a stroke on the same shape
extension Shape {
    public func fillAndStroke(fill fillContent: some ShapeStyle, strokeColor: some ShapeStyle, strokeWidth: CGFloat) -> some View {
        self
            .stroke(strokeColor, lineWidth: strokeWidth)
            .background(fill(fillContent))
    }
}
