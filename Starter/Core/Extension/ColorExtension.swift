//
//  ColorExtension.swift
//  HaveBreak
//
//  Created by iMac on 1/2/23.
//

import Foundation
import SwiftUI
import UIKit

extension Color {

    static let whiteColor = Color("WhiteColor")
    static let whiteColor2 = Color("WhiteColor2")
    static let purpleColor = Color("PurpleColor")
    static let blackColor = Color("BlackColor")
    static let darkGrayText = Color("darkGrayText")
    static let darkGrayText2 = Color("darkGrayText2")
    static let lightGrayText = Color("lightGrayText")
    
}

extension UIColor {
    func image(_ size: CGSize = CGSize(width: 1, height: 1)) -> UIImage {
        return UIGraphicsImageRenderer(size: size).image { rendererContext in
            self.setFill()
            rendererContext.fill(CGRect(origin: .zero, size: size))
        }
    }
}
