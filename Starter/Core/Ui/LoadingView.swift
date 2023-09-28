//
//  LoadingView.swift
//  HaveBreak
//
//  Created by iMac on 2/1/23.
//

import SwiftUI

struct LoadingView: View {
    
    let size:CGSize
    var tintColor: Color = .blue
    
    var body: some View {
        ProgressView()
            .progressViewStyle(CircularProgressViewStyle(tint: tintColor))
            .frame(width:size.width,height:size.height)
    }
}
