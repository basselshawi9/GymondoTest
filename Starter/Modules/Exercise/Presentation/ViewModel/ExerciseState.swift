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


//MARK: - Get Exercises States (waiting, Success, and Error)
class GetExerciseWaitingState:ExerciseState {
    
    static func == (lhs: GetExerciseWaitingState, rhs: GetExerciseWaitingState) -> Bool {
        return true
    }
}

class GetExerciseFailureState:ExerciseState {
    
    static func == (lhs: GetExerciseFailureState, rhs: GetExerciseFailureState) -> Bool {
        return lhs.error.localizedDescription == rhs.error.localizedDescription
    }
    
    let error:Error
    let blocCallBack:()->()
    
    init (error:Error,callBlack:@escaping ()->()) {
        self.error = error
        self.blocCallBack = callBlack
    }
}

class GetExerciseSuccessState:ExerciseState {
    static func == (lhs: GetExerciseSuccessState, rhs: GetExerciseSuccessState) -> Bool {
        return lhs.model == rhs.model
    }
    
    let model:ExercisesModel
    
    init(model:ExercisesModel) {
        self.model = model
    }
}

//MARK: - Get Exercise Images States (waiting, Success, and Error)
class GetExerciseImagesWaitingState:ExerciseState {
    
    static func == (lhs: GetExerciseImagesWaitingState, rhs: GetExerciseImagesWaitingState) -> Bool {
        return true
    }
}

class GetExerciseImagesFailureState:ExerciseState {
    
    static func == (lhs: GetExerciseImagesFailureState, rhs: GetExerciseImagesFailureState) -> Bool {
        return lhs.error.localizedDescription == rhs.error.localizedDescription
    }
    
    let error:Error
    let blocCallBack:()->()
    
    init (error:Error,callBlack:@escaping ()->()) {
        self.error = error
        self.blocCallBack = callBlack
    }
}

class GetExerciseImagesSuccessState:ExerciseState {
    static func == (lhs: GetExerciseImagesSuccessState, rhs: GetExerciseImagesSuccessState) -> Bool {
        return lhs.model == rhs.model
    }
    
    let model:ExerciseImagesModel
    
    init(model:ExerciseImagesModel) {
        self.model = model
    }
}
