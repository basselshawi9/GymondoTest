//
//  ExerciseRemoteDataSource.swift
//  Starter
//
//  Created by iMac on 9/26/23.
//

import Foundation
import Combine
import Alamofire

class ExerciseRemoteDataSrouce: ExerciseDataSrouce {
    
    func getExercises() -> Future<ExercisesModel, Error> {
        
        APIService.shared.apiRequest(converter: ExercisesModel.self, url: getExercisesUrl, method: HTTPMethod.get, parameter: nil, encoder: JSONEncoding.default, headers: NO_AUTHORIZATION_HEADER())
    }
    func getExerciseImages(param: GetExerciseImagesParam) -> Future<ExerciseImagesModel, Error> {
        
        APIService.shared.apiRequest(converter: ExerciseImagesModel.self, url: getExerciseImagesUrl, method: HTTPMethod.get, parameter: param.jsonObject, encoder: URLEncoding.default, headers: NO_AUTHORIZATION_HEADER())
    }
}
