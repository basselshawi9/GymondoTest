//
//  CommonButtons.swift
//  HaveBreak
//
//  Created by iMac on 1/18/23.
//

import SwiftUI

struct CustomBackButton : View {
    var cornerRadius:CGFloat = 20~h
    let pressed:()->()
    
    var body: some View {
        Button {
            self.pressed()
        }label: {
            ZStack {
                Color.whiteColor.opacity(0.7)
                    .frame(width:44~h,height:44~h)
                    .cornerRadius(cornerRadius)
                Image(systemName: "chevron.backward")
                    .foregroundColor(.purpleColor)
                    .frame(width:30~h,height:30~h)
            }
        }
        .frame(width:44~h,height:44~h)
    }
}
