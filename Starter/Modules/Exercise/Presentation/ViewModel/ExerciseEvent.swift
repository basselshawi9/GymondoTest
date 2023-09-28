//
//  ExerciseEvent.swift
//  Starter
//
//  Created by iMac on 9/26/23.
//

import Foundation

protocol ExerciseEvent:BaseEvent {
    
}

class GetExercisesEvent:ExerciseEvent {
    
    static func == (lhs: GetExercisesEvent, rhs: GetExercisesEvent) -> Bool {
        return true
    }
    
}

class GetExerciseByIdEvent:ExerciseEvent {
    
    static func == (lhs: GetExerciseByIdEvent, rhs: GetExerciseByIdEvent) -> Bool {
        return lhs.param == rhs.param
    }
    
    let param:GetExerciseByIdParam
    
    init(param: GetExerciseByIdParam) {
        self.param = param
    }
}
