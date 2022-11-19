//
//  AnimatedCheckmark.swift
//  
//
//  Created by Bubba Hall on 11/19/22.
//
import Foundation
import SwiftUI
import Combine

@available(iOS 13.0, *)
public struct AnimatedCheckmark: View {
    //Checkmark color
    var color: Color
    
    ///Checkmark color
    var size: Int 
    
    var height: CGFloat {
        return CGFloat(size)
    }
    var width: CGFloat {
        return CGFloat(size)
    }
    
    @State private var percentage: CGFloat = .zero
    
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
