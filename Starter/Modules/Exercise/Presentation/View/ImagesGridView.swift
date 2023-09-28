//
//  ImagesGridView.swift
//  Starter
//
//  Created by iMac on 9/27/23.
//

import Foundation
import SwiftUI

struct ImagesGridView : View {
    
    let images:[ExerciseImageModel]
    
    let columns = [GridItem(.adaptive(minimum: 120))]
    
    var body : some View {
        Text("Images")
            .style(fontWeight: .w700, fontSize: 20, textColor: .blackColor)
        LazyVGrid(columns: columns, spacing: 16) {
            ForEach(images) { image in
                if let imageUrl = image.image {
                    FadeInNetworkImage(url:imageUrl, placeHolder:
                                        
                                        ZStack {
                        Color.lightShadowColor
                        
                        LoadingView(size: CGSize(width: 40, height: 40))
                        
                    }
                        .cornerRadius(10)
                        .frame(width:120,height:120),
                                       customizeNetworkImage: { image in
                        image
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .cornerRadius(10)
                            .frame(width:120,height:120)
                    })
                }
            }
        }
    }
}
