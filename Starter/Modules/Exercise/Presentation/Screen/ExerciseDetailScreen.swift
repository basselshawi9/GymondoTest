//
//  ExerciseDetailScreen.swift
//  Starter
//
//  Created by iMac on 9/27/23.
//

import Foundation
import SwiftUI

struct ExerciseDetailScreen : View {
    
    let model : ExerciseModel
    let visitedExercies : [Int]
    @Binding var showExerciseDetailScreen : Bool
    
    @State private var showExerciseVariantDetailScreen = false
    @State private var selectedExercise : ExerciseModel?
    
    var body: some View {
        ZStack {
            NavigationLink("", isActive:$showExerciseVariantDetailScreen) {
                if let _selectedExercise = selectedExercise {
                    ExerciseDetailScreen(model: _selectedExercise, visitedExercies: visitedExercies + [_selectedExercise.id ?? 0], showExerciseDetailScreen: $showExerciseVariantDetailScreen)
                }
            }
            ScrollView (.vertical) {
                LazyVStack (alignment:.leading,spacing:12){
                    if let images = model.images, images.isEmpty == false {
                        ImagesGridView(images: images)
                    }
                    buildVariationExercies()
                }
            }
        }
        .navigationTitle(model.name ?? "Detail")
        .navigationBarTitleDisplayMode(.inline)
        .padding(.horizontal,16)
    }
    
    @ViewBuilder
    func buildVariationExercies()-> some View {
        
        if let variations = model.variations, variations.filter({visitedExercies.contains($0) == false }).isEmpty == false {
            Text("Variations")
                .style(fontWeight: .w700, fontSize: 20, textColor: .blackColor)
            ForEach(variations.filter({visitedExercies.contains($0) == false }),id:\.self) { id in
                ExerciseListItemIdLoaderSwiftUI(exerciseId: id) { model in
                    selectedExercise = model
                    showExerciseVariantDetailScreen = true
                }
                .frame(height:80)
            }
        }
        else {
            EmptyView()
        }
    }
    
}
