//
//  AnimatedCheckmark.swift
//  
//
//  Created by Bubba Hall on 11/19/22.
//
import Foundation
import SwiftUI
import Combine

@available(macOS 10.15, *)
@available(iOS 13.0, *)
public struct AnimatedCheckmark: View {
    /// The color of the checkmark
    var color: Color
    
    /// The size of the check mark
    var size: Int
    
    /// The height of the box around the checkmark
    var height: CGFloat {
        return CGFloat(size)
    }
    
    /// The width of the box around the checkmark
    var width: CGFloat {
        return CGFloat(size)
    }
    
    @State private var percentage: CGFloat = .zero
    
    /// To make a animated checkmark
    ///
    /// This will make a custom animated checkmark that you can customize the color size and percentage
    ///
    /// - Parameter color: The color of the checkmark.
    /// - Parameter size: The size of the checkmark.
    /// - Parameter percentage: ????
    public init(color: Color, size: Int, percentage: CGFloat) {
        self.color = color
        self.size = size
        self.percentage = percentage
    }
    
    public var body: some View {
        Path { path in
            path.move(to: CGPoint(x: 0, y: height / 2))
            path.addLine(to: CGPoint(x: width / 2.5, y: height))
            path.addLine(to: CGPoint(x: width, y: 0))
        }
        .trim(from: 0, to: percentage)
        .stroke(color, style: StrokeStyle(lineWidth: CGFloat(size / 8), lineCap: .round, lineJoin: .round))
        .animation(Animation.spring().speed(0.75).delay(0.25), value: percentage)
        .onAppear {
            percentage = 1.0
        }
        .frame(width: width, height: height, alignment: .center)
    }
}
