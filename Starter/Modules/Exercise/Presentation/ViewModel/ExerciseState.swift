//
//  ExerciseState.swift
//  Starter
//
//  Created by iMac on 9/26/23.
//

import Foundation

class ExerciseState : BaseState {
    
    static func == (lhs: ExerciseState, rhs: ExerciseState) -> Bool {
        return true
    }
}

class InitialExerciseState:ExerciseState{
    static func == (lhs: InitialExerciseState, rhs: InitialExerciseState) -> Bool {
        return true
    }
}

class ExerciseWaitingState:ExerciseState {
    
    static func == (lhs: ExerciseWaitingState, rhs: ExerciseWaitingState) -> Bool {
        return true
    }
}

class ExerciseFailureState:ExerciseState {
    
    static func == (lhs: ExerciseFailureState, rhs: ExerciseFailureState) -> Bool {
        return lhs.error.localizedDescription == rhs.error.localizedDescription
    }
    
    let error:Error
    let blocCallBack:()->()
    
    init (error:Error,callBlack:@escaping ()->()) {
        self.error = error
        self.blocCallBack = callBlack
    }
}

//MARK: - Get Exercises Success State

class GetExerciseSuccessState:ExerciseState {
    static func == (lhs: GetExerciseSuccessState, rhs: GetExerciseSuccessState) -> Bool {
        return lhs.model == rhs.model
    }
    
    let model:ExercisesModel
    
    init(model:ExercisesModel) {
        self.model = model
    }
}

//MARK: - Get Exercise By Id Success State

class GetExerciseByIdSuccessState:ExerciseState {
    static func == (lhs: GetExerciseByIdSuccessState, rhs: GetExerciseByIdSuccessState) -> Bool {
        return lhs.model == rhs.model
    }
    
    let model:ExerciseModel
    
    init(model:ExerciseModel) {
        self.model = model
    }
}
