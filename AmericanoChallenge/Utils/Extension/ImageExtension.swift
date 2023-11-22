//
//  ImageExtension.swift
//  AmericanoChallenge
//
//  Created by Alberto Bruno on 20/11/23.
//

import Foundation
import SwiftUI

extension Image {
    static func createFromData(_ data: Data) -> Image? {
        if let uiImage = UIImage(data: data) {
            return Image(uiImage: uiImage)
        } else {
            return nil
        }
    }
    
    static func getImageDataFromAsset(_ imageName: String) -> Data? {
        guard let uiImage = UIImage(named: imageName) else { return nil }
        return uiImage.pngData()
    }
}
