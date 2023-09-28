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
    
    private let viewModel = ExerciseViewModel()
    @State private var imageUrl = ""
    
    var body: some View {
        
        HStack (spacing:0){
            FadeInNetworkImage(url:imageUrl, placeHolder:
                                
                                ZStack {
                Color.lightShadowColor
                if imageUrl.isEmpty == false {
                    LoadingView(size: CGSize(width: 40, height: 40))
                }
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
            Spacer()
                .frame(width:20)
            Text(model.name ?? "")
                .style(fontWeight: .w600, fontSize: 18, textColor: .black)
            Spacer()
        }
        .onViewDidLoad {
            viewModel.addEvent(event: GetExerciseImagesEvent(param: GetExerciseImagesParam(exerciseBase: model.exerciseBase ?? 0)))
            bindViewModelToState()
        }
        
    }
    
    func bindViewModelToState() {
        
        viewModel.exerciseImagesState.sink(receiveValue: { state in
            if let successState = state as? GetExerciseImagesSuccessState {
                if let images = successState.model.results, images.count > 0 {
                    imageUrl = images.first(where: {$0.isMain == true})?.image ?? ""
                }
                else {
                    imageUrl = ""
                }
            }
        }).store(in: &viewModel.cancelables)
    }
}
