//
//  GetExerciseImagesParam.swift
//  Starter
//
//  Created by iMac on 9/26/23.
//

import Foundation

class GetExerciseImagesParam: BaseParam {
    static func == (lhs: GetExerciseImagesParam, rhs: GetExerciseImagesParam) -> Bool {
        return lhs.exerciseBase == rhs.exerciseBase
    }
    
    private let exerciseBase:Int
    
    init(exerciseBase:Int) {
        self.exerciseBase = exerciseBase
    }
    
    var jsonObject: Dictionary<String, Any> {
        get {
            return ["exercise_base":exerciseBase]
        }
    }
    
}
