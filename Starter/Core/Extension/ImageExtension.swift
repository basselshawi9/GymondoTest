//
//  ImageExtension.swift
//  HaveBreak
//
//  Created by iMac on 2/22/23.
//

import Foundation
import SwiftUI

extension Image {
    @ViewBuilder
    func centerCropped() -> some View {
        GeometryReader { geo in
            self
            .resizable()
            .scaledToFill()
            .frame(width: geo.size.width, height: geo.size.height)
            .clipped()
        }
    }
}
