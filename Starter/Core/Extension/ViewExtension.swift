//
//  ViewExtension.swift
//  SwiftUI-BloC
//
//  Created by iMac on 11/13/22.
//

import Foundation
import SwiftUI

extension View {
    
    func onViewDidLoad(perform action: (() -> Void)? = nil) -> some View {
            self.modifier(ViewDidLoadModifier(action: action))
        }
    
    func eraseType()->AnyView {
        AnyView(self)
    }
    
    @ViewBuilder
    func eraseToSomeView()-> some View {
        self
    }
}
