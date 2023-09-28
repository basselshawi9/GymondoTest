//
//  LottieView.swift
//  HaveBreak
//
//  Created by iMac on 1/7/23.
//

import Foundation
import SwiftUI
import Lottie
 
struct LottieView: UIViewRepresentable {
    let lottieFile: String
    let loop:Bool = true
 

    let animationView = LottieAnimationView()
 
    func makeUIView(context: Context) -> some UIView {
        
        let view = UIView(frame: .zero)
 
        
        animationView.animation = LottieAnimation.named(lottieFile)
        animationView.contentMode = .scaleAspectFit
        animationView.play()
        if loop {
            animationView.loopMode = .loop
        }
        view.addSubview(animationView)
 
        animationView.translatesAutoresizingMaskIntoConstraints = false
        animationView.heightAnchor.constraint(equalTo: view.heightAnchor).isActive = true
        animationView.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
 
        return view
    }
 
    func updateUIView(_ uiView: UIViewType, context: Context) {
 
    }
}
