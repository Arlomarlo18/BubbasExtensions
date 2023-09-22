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
    /// This gets the path to a image in the file manager
    ///
    /// You can put a optional URL into this initializer and if it finds that path in will return that image and if it does not find the path it will return a string that will go to your assets as a default image.
    ///
    /// ```
    /// Image(path: vm.fileManager.getPathForImage(name: collection.id?.uuidString ?? ""))
    /// ```
    ///
    /// - Parameter path: This is a Optional URL which is a path to the image you want from the File Manager.
    /// - Parameter defaultImageName: This is a string if the path comes back nil, It will go into assets and grab the image connected to the defaultImageName
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
