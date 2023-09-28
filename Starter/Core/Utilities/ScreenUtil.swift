//
//  ScreenUtil.swift
//  HaveBreak
//
//  Created by iMac on 1/4/23.
//

import Foundation
import SwiftUI

let w = "width"
let h = "height"

class ScreenUtil {
    
    let width:Double
    let height:Double
    
    init (width:Double,height:Double) {
        self.width = width
        self.height = height
        
    }
}

infix operator ~
func ~ (lhs: Double, rhs: String) -> Double {
    
    var desginWidth = 428.0
    var desginHeight = 926.0
    
    if let screenUtil : ScreenUtil =  DependencyInjector.shared.getService() {
        
        desginWidth = screenUtil.width
        desginHeight = screenUtil.height
    }
    
    if rhs == w {
        let widthRatio = UIScreen.main.bounds.width/desginWidth
        return widthRatio*lhs
    }
    else if rhs == h {
        let heightRatio = UIScreen.main.bounds.height/desginHeight
        return heightRatio*lhs
    }
    else {
        return lhs
    }
 
}
