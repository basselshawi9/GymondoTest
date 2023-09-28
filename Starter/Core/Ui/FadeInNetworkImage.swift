//
//  FadeInNetworkImage.swift
//  HaveBreak
//
//  Created by iMac on 2/7/23.
//

import SwiftUI
import CachedAsyncImage

struct FadeInNetworkImage: View {
        
    let url:String
    let placeHolder:any View
    let customizeNetworkImage: ((Image)->(any View))?
    
    var body: some View {
        
        CachedAsyncImage(url: URL(string: url)){
            image in
            customizeNetworkImage == nil ? image.customTransition().eraseType() : customizeNetworkImage!(image).customTransition().eraseType()

        } placeholder: {
            placeHolder
                .customTransition()
                .eraseType()
        }
    }
}
