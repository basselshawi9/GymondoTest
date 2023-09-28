//
//  CustomSheet.swift
//  HaveBreak
//
//  Created by iMac on 1/31/23.
//

import Foundation
import SwiftUI


struct CustomSheet<Content:View>:View{
    
    
    @Binding var show : Bool
    let originalView:any View
    @ViewBuilder let content: () -> Content
    let height:CGFloat
    @State var offset:CGFloat = 0
    
    var body : some View {
        ZStack(alignment:.bottom) {
            originalView.eraseType()
            if show {
                Color.blackColor.opacity(0.1)
                    .ignoresSafeArea()
                    .onTapGesture {
                        show = false
                    }
                    .transition(.opacity)
                Color.whiteColor
                    .frame(height:height/5)
                    .transition(.opacity)
            }
            if show {
                content()
                    .frame(height:height)
                    .offset(y:offset)
                    .transition(.move(edge: .bottom))
                    .zIndex(2)
                    .gesture(DragGesture(minimumDistance:0).onChanged({ transition in
                        if transition.translation.height > 0 {
                            offset=transition.translation.height
                        }
                        
                    }).onEnded({ transition in
                        if offset > height/2 {
                            show = false
                            DispatchQueue.main.asyncAfter(deadline: DispatchTime.now()+0.7) {
                                offset = 0
                            }
                        }
                        else {
                            offset = 0
                        }
                        
                    }))
            }
        }
        .ignoresSafeArea()
        .animation(.default.speed(0.7), value: show)
    }
}

extension View {
    
    @ViewBuilder
    func customSheet<Content:View>(isPresented:Binding<Bool>,height:CGFloat=380~h,@ViewBuilder content:@escaping ()->Content)->some View {
         CustomSheet(show: isPresented, originalView: self, content: content, height: height)
    }
    
}
