//
//  ExerciseRepository.swift
//  Starter
//
//  Created by iMac on 9/26/23.
//

import Foundation
import Combine

class ExerciseRespository {
    
    let datasrouce:ExerciseDataSrouce
    
    init(datasrouce: ExerciseDataSrouce) {
        self.datasrouce = datasrouce
    }
    
    func getExercises() -> Future<ExercisesModel, Error> {
        datasrouce.getExercises()
    }
    
    func getExerciseById(param:GetExerciseByIdParam) -> Future<ExerciseModel, Error> {
        datasrouce.getExerciseById(param: param)
    }
    
}
