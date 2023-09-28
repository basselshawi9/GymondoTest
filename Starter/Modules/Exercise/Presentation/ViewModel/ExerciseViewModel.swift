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
    
    var exerciseByIdState = CurrentValueSubject<any BaseState,Never>(InitialExerciseState())
        
    var cancelables : Set<AnyCancellable> = []
    
    func addEvent<ExerciseEvent>(event: ExerciseEvent) {
        if let getExercisesEvent = event as? GetExercisesEvent {
            mapGetExercisesEvent(event: getExercisesEvent)
        }
        else if let getExerciseByIdEvent = event as? GetExerciseByIdEvent {
            mapGetExerciseByIdEvent(event: getExerciseByIdEvent)
        }
    }
    
    private func mapGetExercisesEvent(event:GetExercisesEvent) {
        exercisesState.send(ExerciseWaitingState())
        
        if let _exerciseDataSource = DependencyInjector.injectExerciseDataSource() {
            
            let repository = ExerciseRespository(datasrouce: _exerciseDataSource)
            repository.getExercises().receive(on: DispatchQueue.main).sink { completion in
                switch completion {
                case .failure(let err):
                    self.exercisesState.send(ExerciseFailureState(error: err) {
                        
                    })
                    break
                case .finished:
                    break
                }
                
            } receiveValue: { model in
                self.exercisesState.send(GetExerciseSuccessState(model: model))
                
                if _exerciseDataSource is ExerciseRemoteDataSrouce {
                    if let local : ExerciseLocalDataSrouce = DependencyInjector.shared.getService(), let exercies = model.results {
                        let _ = local.save(exercies: exercies)
                    }
                }
                
            }.store(in: &cancelables)
        }
    }
    
    private func mapGetExerciseByIdEvent(event:GetExerciseByIdEvent) {
        exerciseByIdState.send(ExerciseWaitingState())
        
        if let _exerciseDataSource = DependencyInjector.injectExerciseDataSource() {
            
            let repository = ExerciseRespository(datasrouce: _exerciseDataSource)
            repository.getExerciseById(param: event.param).receive(on: DispatchQueue.main).sink { completion in
                switch completion {
                case .failure(let err):
                    self.exerciseByIdState.send(ExerciseFailureState(error: err) {
                        
                    })
                    break
                case .finished:
                    break
                }
                
            } receiveValue: { model in
                
                self.exerciseByIdState.send(GetExerciseByIdSuccessState(model: model))
                if _exerciseDataSource is ExerciseRemoteDataSrouce {
                    if let local : ExerciseLocalDataSrouce = DependencyInjector.shared.getService() {
                        let _ = local.save(exercies: [model])
                    }
                }
                
            }.store(in: &cancelables)
        }
    }
        
}
