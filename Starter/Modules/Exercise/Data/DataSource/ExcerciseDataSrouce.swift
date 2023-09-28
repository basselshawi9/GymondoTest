//
//  ExcersizeDataSrouce.swift
//  Starter
//
//  Created by iMac on 9/26/23.
//

import Foundation
import Combine

protocol ExerciseDataSrouce  {
    
    func getExercises()->Future<ExercisesModel,Error>
    func getExerciseImages(param:GetExerciseImagesParam)->Future<ExerciseImagesModel,Error>
    
}
