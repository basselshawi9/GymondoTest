//
//  ViewDidLoadModifier.swift
//  HaveBreak
//
//  Created by iMac on 6/19/23.
//

import Foundation
import SwiftUI

struct ViewDidLoadModifier: ViewModifier {
    @State private var viewDidLoad = false
    let action: (() -> Void)?
    
    func body(content: Content) -> some View {
        content
            .onAppear {
                if viewDidLoad == false {
                    viewDidLoad = true
                    action?()
                }
            }
    }
}
