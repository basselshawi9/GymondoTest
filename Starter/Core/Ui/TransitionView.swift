//
//  TransitionView.swift
//  HaveBreak
//
//  Created by iMac on 2/2/23.
//

import SwiftUI

struct TransitionView: View {
    
    let transition:AnyTransition
    let addSpeed:CGFloat
    let removalSpeed:CGFloat
    let originalView:any View
    
    @State private var show = false
    var body: some View {
        
        Group {
            if show {
                
                originalView.transition(AnyTransition.asymmetric(insertion: transition.animation(.default.speed(addSpeed)), removal: transition.animation(.default.speed(removalSpeed)))).eraseType()
            }
            else {
                Color.white
                    .opacity(0.01)
                    .frame(width:2,height:2)
                    .eraseType()
            }
        }
        .onAppear {
            
            show = true
        }
        
    }
}

extension View {
    
    @ViewBuilder
    func customTransition(transition:AnyTransition = .opacity,addSpeed:CGFloat = 0.6,removalSpeed:CGFloat = 3)->some View {
        TransitionView(transition: transition, addSpeed: addSpeed, removalSpeed: removalSpeed, originalView: self)
    }
}
