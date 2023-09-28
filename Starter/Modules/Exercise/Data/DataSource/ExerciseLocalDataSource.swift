//
//  ExerciseLocalDataSource.swift
//  Starter
//
//  Created by iMac on 9/27/23.
//

import Foundation
import Combine

class ExerciseLocalDataSrouce: ExerciseDataSrouce {
    
    func getExercises() -> Future<ExercisesModel, Error> {
        
        Future<ExercisesModel, Error> { promise in
            
            if let cachedString = UserDefaults.cachedExercises, let cachedData = cachedString.data(using: .utf8), let exercies = try? JSONDecoder().decode([ExerciseModel].self, from: cachedData) {
                promise(.success(ExercisesModel(count: nil,next: nil, previous: nil, results: exercies)))
            }
            else {
                promise(.failure(CustomError(errorDescription: "No Cached Data")))
            }
            
        }
    }
    
    func getExerciseById(param: GetExerciseByIdParam) -> Future<ExerciseModel, Error> {
        
        Future<ExerciseModel, Error> { promise in
            
            if let cachedString = UserDefaults.cachedExercises, let cachedData = cachedString.data(using: .utf8), let exercies = try? JSONDecoder().decode([ExerciseModel].self, from: cachedData) {
                if let queriedExecise = exercies.first(where: {$0.id == param.id}) {
                    promise(.success(queriedExecise))
                }
                else {
                    promise(.failure(CustomError(errorDescription: "Exercise Not Found")))
                }
            }
            else {
                promise(.failure(CustomError(errorDescription: "No Cached Data")))
            }
            
        }
        
    }
    
    func save(exercies:[ExerciseModel]) -> Future<Bool, Error> {
        
        Future<Bool, Error> { promise in
            var exerciesToSave = exercies
            if let cachedString = UserDefaults.cachedExercises, let cachedData = cachedString.data(using: .utf8), var cachedExercises = try? JSONDecoder().decode([ExerciseModel].self, from: cachedData) {
                
                let exerciesIds = exerciesToSave.map { $0.id }
                cachedExercises.removeAll(where: {exerciesIds.contains($0.id)})
                exerciesToSave += cachedExercises
            }
            if let data = try? JSONEncoder().encode(exerciesToSave), let dataString = String(data: data, encoding: .utf8) {
                UserDefaults.cachedExercises = dataString
                promise(.success(true))
            }
            else {
                promise(.failure(CustomError(errorDescription: "Couldn't save exercises")))
            }
        }
    }
}
