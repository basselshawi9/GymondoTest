//
//  CustomSegmentedControl.swift
//  HaveBreak
//
//  Created by iMac on 1/6/23.
//

import Foundation
import SwiftUI

struct CustomSegmentedControl : View {
    
    @Binding var selectedIndex : Int
    let titles : [String]
    let selectedValueChanged : (Int)->()
    
    var body: some View {
        ZStack (alignment:.leading){
            Color.whiteColor
            Color.purpleColor
                .frame(width: 170~w,height: 42~h)
                .cornerRadius(20~h)
                .zIndex(1)
                .offset(x: (8~w) + (selectedIndex == 1 ? 180~w : 0))
            HStack {
                Text(titles[0])
                    .modifier(TextModifier(fontWeight: .w500, fontSize: 20, textColor: selectedIndex == 0 ? .whiteColor : .purpleColor))
                    
                    .frame(width:140~w)
                Spacer()
                Text(titles[1])
                    .modifier(TextModifier(fontWeight: .w500, fontSize: 20, textColor: selectedIndex == 1 ? .whiteColor : .purpleColor))
                    
                    .frame(width:140~w)
            }
            .modifier(PaddingModifier(axis: .horizontal, value: 22~w))
            .zIndex(2)
        }
        .frame(width: 365~w,height:60~h)
        .cornerRadius(20~h)
        .shadow(color: Color.shadowColor2, radius: 12,x:0,y:3)
        .gesture(DragGesture(minimumDistance: 0).onEnded({ (value) in
            
            if value.location.x > (182~w) {
                withAnimation(.easeIn(duration: 0.5)) {
                    selectedIndex = 1
                    selectedValueChanged(selectedIndex)
                }
            }
            else {
                withAnimation(.easeIn(duration: 0.3)) {
                    selectedIndex = 0
                    selectedValueChanged(selectedIndex)
                }
            }
        }))
    }
}
