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
