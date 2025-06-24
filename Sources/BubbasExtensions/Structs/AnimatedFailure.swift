//
//  AnimatedFailure.swift
//  BubbasExtensions
//
//  Created by Bubba Hall on 6/24/25.
//

import Foundation
import SwiftUI
import Combine

/// A custom animated failure view that displays an "X" symbol.
///
/// This view creates a customizable animated failure symbol (X) that can be used throughout your app.
///
/// - Parameters:
///   - color: The color of the failure symbol.
///   - size: The overall size of the failure symbol.
///   - percentage: The drawing progress from 0 to 1. Used for animation.
@available(macOS 10.15, *)
@available(iOS 13.0, *)
public struct AnimatedFailure: View {
    /// The color of the failure symbol
    var color: Color

    /// The size of the failure symbol
    var size: Int

    /// The height of the bounding box for the failure symbol
    var height: CGFloat {
        CGFloat(size)
    }

    /// The width of the bounding box for the failure symbol
    var width: CGFloat {
        CGFloat(size)
    }

    /// The drawing percentage used to animate the symbol
    @State private var percentage: CGFloat = .zero

    /// Initializes a new AnimatedFailure view
    ///
    /// - Parameters:
    ///   - color: The color of the failure symbol.
    ///   - size: The size of the failure symbol.
    ///   - percentage: The starting draw percentage.
    public init(color: Color, size: Int, percentage: CGFloat) {
        self.color = color
        self.size = size
        self.percentage = percentage
    }

    /// The animated drawing of the failure "X" shape
    public var body: some View {
        ZStack {
            Path { path in
                path.move(to: CGPoint(x: 0, y: 0))
                path.addLine(to: CGPoint(x: width, y: height))
            }
            .trim(from: 0, to: percentage)
            .stroke(color, style: StrokeStyle(lineWidth: CGFloat(size / 8), lineCap: .round, lineJoin: .round))

            Path { path in
                path.move(to: CGPoint(x: width, y: 0))
                path.addLine(to: CGPoint(x: 0, y: height))
            }
            .trim(from: 0, to: percentage)
            .stroke(color, style: StrokeStyle(lineWidth: CGFloat(size / 8), lineCap: .round, lineJoin: .round))
        }
        .animation(Animation.spring().speed(0.75).delay(0.25), value: percentage)
        .onAppear {
            percentage = 1.0
        }
        .frame(width: width, height: height, alignment: .center)
    }
}
