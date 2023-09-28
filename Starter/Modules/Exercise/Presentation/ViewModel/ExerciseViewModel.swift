//
//  ExerciseViewModel.swift
//  Starter
//
//  Created by iMac on 9/26/23.
//

import Foundation
import Combine

class ExerciseViewModel : BaseViewModel {
    
    var exercisesState = CurrentValueSubject<any BaseState,Never>(InitialExerciseState())
    
    var exerciseImagesState = CurrentValueSubject<any BaseState,Never>(InitialExerciseState())
    
    var cancelables : Set<AnyCancellable> = []
    
    func addEvent<ExerciseEvent>(event: ExerciseEvent) {
        if let getExercisesEvent = event as? GetExercisesEvent {
            mapGetExercisesEvent(event: getExercisesEvent)
        }
        else if let getExerciseImagesEvent = event as? GetExerciseImagesEvent {
            mapGetExerciseImagesEvent(event: getExerciseImagesEvent)
        }
        
    }
    
    private func mapGetExercisesEvent(event:GetExercisesEvent) {
        exercisesState.send(GetExerciseWaitingState())
        
        if let remoteDataSource : ExerciseRemoteDataSrouce = ServiceLocator.shared.getService() {
            
            let repository = ExerciseRespository(datasrouce: remoteDataSource)
            repository.getExercises().receive(on: DispatchQueue.main).sink { completion in
                switch completion {
                case .failure(let err):
                    self.exercisesState.send(GetExerciseFailureState(error: err) {
                        
                    })
                    break
                case .finished:
                    break
                }
                
            } receiveValue: { model in
                self.exercisesState.send(GetExerciseSuccessState(model: model))
                
            }.store(in: &cancelables)
        }
    }
    
    private func mapGetExerciseImagesEvent(event:GetExerciseImagesEvent) {
        exerciseImagesState.send(GetExerciseImagesWaitingState())
        
        if let remoteDataSource : ExerciseRemoteDataSrouce = ServiceLocator.shared.getService() {
            
            let repository = ExerciseRespository(datasrouce: remoteDataSource)
            repository.getExerciseImages(param: event.param).receive(on: DispatchQueue.main).sink { completion in
                switch completion {
                case .failure(let err):
                    self.exerciseImagesState.send(GetExerciseImagesFailureState(error: err) {
                        
                    })
                    break
                case .finished:
                    break
                }
                
            } receiveValue: { model in
                self.exerciseImagesState.send(GetExerciseImagesSuccessState(model: model))
                
            }.store(in: &cancelables)
        }
    }
    
}
