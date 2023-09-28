//
//  File.swift
//  HaveBreak
//
//  Created by iMac on 1/3/23.
//

import Foundation
import SwiftUI

struct CustomButton : View {
    
    var width : CGFloat? = 64
    var height : CGFloat? = 30
    var backgroundColor : Color? = Color.whiteColor
    var textColor : Color? = Color.blackColor
    var text:String? = "See All"
    var textSize:CGFloat? = 14
    var fontWeight:FontWeights = .w500
    var showShadow = true
    var cornerRadius:CGFloat?
    let buttonPressed : ()->()
    
    var body : some View {
        
        Button {
            withAnimation(.default) {
                self.buttonPressed()
            }
        }label: {
            ZStack {
                RoundedRectangle(cornerRadius: cornerRadius ?? height!/2)
                    .fill(backgroundColor!)
                Text(text!)
                    .font(TextModifier.weightToFont(fontWeight: fontWeight, fontSize: textSize!))
                    
                    .foregroundColor(textColor)
            }
            .frame(width: width,height: height)
            .clipShape(RoundedRectangle(cornerRadius: cornerRadius ?? height!/2))
            .shadow(color: Color.shadowColor, radius: showShadow == true ? 6 : 0,x:0,y:1)
        }
    }
}

struct CustomButton_Previews : PreviewProvider {
    
    static var previews : some View {
        
        CustomButton {
            
        }
    }
}
