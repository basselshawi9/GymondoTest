//
//  TextModifier.swift
//  HaveBreak
//
//  Created by iMac on 1/5/23.
//

import Foundation
import SwiftUI


enum FontWeights {
    case w100,w200,w300,w400,w500,w600,w700,w800,w900
}

extension Text {
    
    func style(fontWeight:FontWeights,fontSize:CGFloat,textColor:Color,isItalic:Bool = false)->Text {
        
        let font = TextModifier.weightToFont(fontWeight: fontWeight, fontSize: fontSize,isItalic: isItalic)
        return self.font(font).foregroundColor(textColor)
    }
}

struct TextModifier: ViewModifier {
    
    let fontWeight:FontWeights
    let fontSize:CGFloat
    let textColor:Color
    var isItalic:Bool = false
    
    func body(content: Content) -> some View {
        
        var font:Font!
        switch fontWeight {
        case .w100:
            font = isItalic == false ? Font.gloryThin(with: fontSize) : Font.gloryThinItalic(with: fontSize)
        case .w200:
            font = isItalic == false ? Font.gloryExtraLight(with: fontSize) : Font.gloryExtraLightItalic(with: fontSize)
        case .w300:
            font = isItalic == false ? Font.gloryLight(with: fontSize) : Font.gloryLightItalic(with: fontSize)
        case .w400:
            font = isItalic == false ? Font.gloryRegular(with: fontSize) : Font.gloryRegularItalic(with: fontSize)
        case .w500:
            font = isItalic == false ? Font.gloryMedium(with: fontSize) : Font.gloryMediumItalic(with: fontSize)
        case .w600:
            font = isItalic == false ? Font.glorySemiBold(with: fontSize) : Font.glorySemiBoldItalic(with: fontSize)
        case .w700:
            font = isItalic == false ? Font.gloryBold(with: fontSize) : Font.gloryBoldItalic(with: fontSize)
        case .w800:
            font = isItalic == false ? Font.gloryExtraBold(with: fontSize) : Font.gloryExtraBoldItalic(with: fontSize)
        case .w900:
            font = isItalic == false ? Font.gloryExtraBold(with: fontSize) : Font.gloryExtraBoldItalic(with: fontSize)
        }
        return content
            .font(font)
            .foregroundColor(textColor)
        
    }
    
    static func weightToFont(fontWeight:FontWeights,fontSize:CGFloat, isItalic:Bool = false) -> Font {
        var font:Font!
        switch fontWeight {
        case .w100:
            font = isItalic == false ? Font.gloryThin(with: fontSize) : Font.gloryThinItalic(with: fontSize)
        case .w200:
            font = isItalic == false ? Font.gloryExtraLight(with: fontSize) : Font.gloryExtraLightItalic(with: fontSize)
        case .w300:
            font = isItalic == false ? Font.gloryLight(with: fontSize) : Font.gloryLightItalic(with: fontSize)
        case .w400:
            font = isItalic == false ? Font.gloryRegular(with: fontSize) : Font.gloryRegularItalic(with: fontSize)
        case .w500:
            font = isItalic == false ? Font.gloryMedium(with: fontSize) : Font.gloryMediumItalic(with: fontSize)
        case .w600:
            font = isItalic == false ? Font.glorySemiBold(with: fontSize) : Font.glorySemiBoldItalic(with: fontSize)
        case .w700:
            font = isItalic == false ? Font.gloryBold(with: fontSize) : Font.gloryBoldItalic(with: fontSize)
        case .w800:
            font = isItalic == false ? Font.gloryExtraBold(with: fontSize) : Font.gloryExtraBoldItalic(with: fontSize)
        case .w900:
            font = isItalic == false ? Font.gloryExtraBold(with: fontSize) : Font.gloryExtraBoldItalic(with: fontSize)
        }
        return font
    }
}
