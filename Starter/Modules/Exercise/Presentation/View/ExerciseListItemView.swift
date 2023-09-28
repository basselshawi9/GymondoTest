//
//  ExerciseListItemView.swift
//  Starter
//
//  Created by iMac on 9/26/23.
//

import Foundation
import SwiftUI

struct ExerciseListItemView : View {
    
    let model:ExerciseModel
    let itemSelected : ()->()
    
    var body: some View {
        
        HStack (spacing:0){
            if let imageUrl = model.images?.first(where: {$0.isMain == true})?.image {
                FadeInNetworkImage(url:imageUrl, placeHolder:
                                    
                                    ZStack {
                    Color.lightShadowColor
                    LoadingView(size: CGSize(width: 40, height: 40))
                    
                }
                    .cornerRadius(10)
                    .frame(width:80,height:80),
                                   customizeNetworkImage: { image in
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .cornerRadius(10)
                        .frame(width:80,height:80)
                })
            }
            else {
                Color.lightShadowColor
                    .cornerRadius(10)
                    .frame(width:80,height:80)
            }
            
            Spacer()
                .frame(width:20)
            Text(model.name ?? "")
                .style(fontWeight: .w600, fontSize: 18, textColor: .black)
            Spacer()
        }
        .onTapGesture {
            self.itemSelected()
        }
    }
    
}
