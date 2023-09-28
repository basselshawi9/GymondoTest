//
//  GetExerciseByIdParam.swift
//  Starter
//
//  Created by iMac on 9/27/23.
//

import Foundation

class GetExerciseByIdParam: BaseParam {
    static func == (lhs: GetExerciseByIdParam, rhs: GetExerciseByIdParam) -> Bool {
        return lhs.id == rhs.id
    }
    
    let id:Int
    
    init(id:Int) {
        self.id = id
    }
    
    var jsonObject: Dictionary<String, Any> {
        get {
            return [:]
        }
    }
    
}
