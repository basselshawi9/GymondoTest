//
//  FadeInNetworkImage.swift
//  HaveBreak
//
//  Created by iMac on 2/7/23.
//

import SwiftUI
import SDWebImageSwiftUI

struct FadeInNetworkImage: View {
    
    let url:String
    let size:CGSize
    
    var body: some View {
        
        WebImage(url: URL(string: url))
        
            .onSuccess { image, data, cacheType in
            }
            .resizable()
            .placeholder{
                PlaceHolderView(size: size)
            }
            .indicator(.activity)
            .transition(.fade(duration: 0.5))
            .scaledToFit()
            .frame(width: size.width,height:size.height)
        
    }
    
}

struct PlaceHolderView : View {
    
    let size:CGSize
    
    var body : some View {
        ZStack {
            Color.lightGrayText.opacity(0.4)
            Image(systemName: "lungs")
                .foregroundColor(.blackColor)
                .frame(width: size.width*0.8,height: size.height*0.8)
        }
        .shadow(radius: 3)
        .cornerRadius(10)
        .frame(width: size.width,height:size.height)
    }
}
