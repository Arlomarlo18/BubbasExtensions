//
//  ImagePlusPath.swift
//  
//
//  Created by Bubba Hall on 7/30/23.
//

import Foundation
import SwiftUI

@available(iOS 13.0, *)
extension Image {
    public init(path: URL?, defaultImageName: String) {
        guard let path = path else { self.init(defaultImageName); return }
        do {
            let data = try Data(contentsOf: path)
            self.init(uiImage: UIImage(data: data) ?? UIImage(named: defaultImageName)!)
        } catch {
            self.init(defaultImageName)
        }
    }
}
