//
//  ExercisesScreen.swift
//  Starter
//
//  Created by iMac on 9/26/23.
//

import Foundation
import SwiftUI

struct ExercisesScreen : View {
    
    var viewModel : ExerciseViewModel {
        if let _viewModel : ExerciseViewModel = ServiceLocator.shared.getService() {
            return _viewModel
        }
        else {
            return ExerciseViewModel()
        }
    }
    
    @StateObject var exercisesState = ViewModelState()
    
    var body: some View {
        NavigationView {
            
            Group {
                if let exerciseSuccessState = exercisesState.state as? GetExerciseSuccessState {
                    buildContent(model: exerciseSuccessState.model)
                }
                else if let _ = exercisesState.state as? GetExerciseWaitingState {
                    LoadingView(size: CGSize(width: 40, height: 40))
                }
                else if let _ = exercisesState.state as? GetExerciseFailureState {
                    CustomErrorView(text: "Error Getting Exercises") {
                        viewModel.addEvent(event: GetExercisesEvent())
                    }
                }
            }
            .navigationTitle("Exercises")
        }
        .onViewDidLoad{
            
            viewModel.addEvent(event: GetExercisesEvent())
            bindViewModelToState()
        }
    }
    
    @ViewBuilder
    func buildContent(model:ExercisesModel)-> some View {
        ScrollView(.vertical) {
            LazyVStack {
                if let exercises = model.results {
                    ForEach(exercises) { item in
                        ExerciseListItemView(model: item)
                    }
                }
            }
        }
        .padding(.horizontal,16)
    }
    
    func bindViewModelToState() {
        
        viewModel.exercisesState.sink(receiveValue: { state in
            exercisesState.state = state
        }).store(in: &viewModel.cancelables)
    }
}
