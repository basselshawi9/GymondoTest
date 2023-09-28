//
//  ExercisesScreen.swift
//  Starter
//
//  Created by iMac on 9/26/23.
//

import Foundation
import SwiftUI

struct ExercisesScreen : View {
    
    private var viewModel : ExerciseViewModel {
        if let _viewModel : ExerciseViewModel = DependencyInjector.shared.getService() {
            return _viewModel
        }
        else {
            return ExerciseViewModel()
        }
    }
    
    @StateObject private var exercisesState = ViewModelState()
    @State private var showExerciseDetailScreen = false
    @State private var selectedExercise : ExerciseModel?
   
    var body: some View {
        
        
        return ZStack {
            NavigationLink("", isActive:$showExerciseDetailScreen) {
                if let _selectedExercise = selectedExercise {
                    ExerciseDetailScreen(model: _selectedExercise, visitedExercies: [_selectedExercise.id ?? 0], showExerciseDetailScreen: $showExerciseDetailScreen)
                }
            }
            Group {
                if let exerciseSuccessState = exercisesState.state as? GetExerciseSuccessState {
                    buildContent(model: exerciseSuccessState.model)
                }
                else if let _ = exercisesState.state as? ExerciseWaitingState {
                    LoadingView(size: CGSize(width: 40, height: 40))
                }
                else if let _ = exercisesState.state as? ExerciseFailureState {
                    CustomErrorView(text: "Error Getting Exercises") {
                        viewModel.addEvent(event: GetExercisesEvent())
                    }
                }
            }
        }
        .navigationTitle("Exercises")
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
                        ExerciseListItemView(model: item) {
                            selectedExercise = item
                            showExerciseDetailScreen = true
                        }
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
