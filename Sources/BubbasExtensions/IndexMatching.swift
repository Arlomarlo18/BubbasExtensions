//
//  File.swift
//  
//
//  Created by Bubba hall on 10/5/22.
//

import Foundation
import SwiftUI

@available(iOS 13.0, *)
extension Collection where Element: Identifiable {
    public func index(matching element: Element) -> Self.Index? {
        firstIndex(where: { $0.id == element.id })
    }
}

@available(iOS 13.0, *)
extension RangeReplaceableCollection where Element: Identifiable {
    mutating func remove(_ element: Element) {
        if let index = index(matching: element) {
            remove(at: index)
        }
    }

    subscript(_ element: Element) -> Element {
        get {
            if let index = index(matching: element) {
                return self[index]
            } else {
                return element
            }
        }
        set {
            if let index = index(matching: element) {
                replaceSubrange(index...index, with: [newValue])
            }
        }
    }
}
