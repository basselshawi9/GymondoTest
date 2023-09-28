//
//  PaddingModifier.swift
//  HaveBreak
//
//  Created by iMac on 1/5/23.
//

import Foundation
import SwiftUI

enum PaddingAxis {
    case vertical,horizontal
}

struct PaddingModifier: ViewModifier {
    
    let axis:PaddingAxis
    let value:CGFloat
   
    
    @ViewBuilder
    func body(content: Content) -> some View {
   
        if axis == .horizontal {
             content
                .padding(.leading,value)
                .padding(.trailing,value)
        }
        else {
             content
                .padding(.top,value)
                .padding(.bottom,value)
        }
            
    }
}

