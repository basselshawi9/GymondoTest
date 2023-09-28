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

class GetExerciseImagesEvent:ExerciseEvent {
    
    static func == (lhs: GetExerciseImagesEvent, rhs: GetExerciseImagesEvent) -> Bool {
        return lhs.param == rhs.param
    }
    
    let param:GetExerciseImagesParam
    
    init(param: GetExerciseImagesParam) {
        self.param = param
    }
}
