//
//  OutlinedButton.swift
//  HaveBreak
//
//  Created by iMac on 1/6/23.
//

import Foundation
import SwiftUI

struct OutlinedButton : View {
    
    var width : CGFloat? = 260~w
    var height : CGFloat? = 36~h
    var backgroundColor : Color? = Color.whiteColor
    var borderColor : Color? = Color.purpleColor
    var text:String = "Follow"
    var textWeight:FontWeights = .w600
    var textSize:CGFloat = 16
    var textColor:Color?
    var borderWidth:CGFloat=2
    var showShadow = true
    var cornerRadius:CGFloat? = nil
    var prefix:(any View)?
    let buttonPressed : ()->()
    
    var body : some View {
        
        Button {
            
            withAnimation(.default) {
                self.buttonPressed()
            }
        }label: {
            ZStack {
                backgroundColor
                if prefix != nil {
                    HStack {
                        prefix!.eraseType()
                        Spacer()
                    }
                }
                Text(text)
                    .modifier(TextModifier(fontWeight: textWeight, fontSize: textSize, textColor:  textColor ?? borderColor!))
                
                RoundedRectangle(cornerRadius:cornerRadius ?? height!/2)
                    .stroke(borderColor!,lineWidth: borderWidth)
                
            }
            .cornerRadius(cornerRadius ?? height!/2)
            .frame(width: width,height: height)
            .shadow(color: Color.shadowColor2, radius: showShadow == false ? 0 :8,x:0,y:showShadow == false ? 0 :3)
            
        }
    }
}

struct OutlinedButton_Previews : PreviewProvider {
    
    static var previews : some View {
        
        OutlinedButton(prefix:Text("asfasdfsdf")) {
            
        }
    }
}
