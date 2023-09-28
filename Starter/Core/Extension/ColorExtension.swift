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
    static let lightShadowColor = Color("LightShadowColor")
    static let pinkGradientColor = Color("PinkGradientColor")
    static let purpleGradientColor = Color("PurpleGradientColor")
    static let shadowColor = Color("shadowColor")
    static let shadowColor2 = Color("shadowColor2")
    static let circleGray = Color("CircleGray")
    static let circleGray2 = Color("CircleGray2")
    static let darkGrayText = Color("darkGrayText")
    static let darkGrayText2 = Color("darkGrayText2")
    static let lightGrayText = Color("lightGrayText")
    static let offWhite = Color("OffWhite")
    static let timeLineItemColor = Color("timeLineItemColor")
    static let greenColor = Color("greenColor")
    static let offWhite2 = Color("offWhite2")
    static let orangeColor = Color("orangeColor")
    static let orangeColor2 = Color("orangeColor2")
    static let profileGradient1 = Color("profileGradient1")
    static let profileGradient2 = Color("profileGradient2")
    static let profileGradient3 = Color("profileGradient3")
    static let borderColor = Color("borderColor")
    static let borderColor2 = Color("borderColor2")
    static let blackColor2 = Color("blackColor2")
}

extension UIColor {
    func image(_ size: CGSize = CGSize(width: 1, height: 1)) -> UIImage {
        return UIGraphicsImageRenderer(size: size).image { rendererContext in
            self.setFill()
            rendererContext.fill(CGRect(origin: .zero, size: size))
        }
    }
}
