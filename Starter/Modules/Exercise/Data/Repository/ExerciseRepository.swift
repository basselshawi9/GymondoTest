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
    func cacheExercies(exercies:[ExerciseModel]) -> Future<Bool, Error> {
        if datasrouce is ExerciseRemoteDataSrouce {
            
            if let local : ExerciseLocalDataSrouce = DependencyInjector.shared.getService(){
                return local.save(exercies: exercies)
            }
            else {
                return Future<Bool, Error> { promise in
                    promise(.failure(CustomError(errorDescription: "Couldn't locate local datasrouce")))
                    
                }
            }
        }
        else {
            return Future<Bool, Error> { promise in
                promise(.failure(CustomError(errorDescription: "Error, can't cache local datasrouce")))
                
            }
        }
    }
}
