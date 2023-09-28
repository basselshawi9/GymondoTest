//
//  ExercisesModel.swift
//  Starter
//
//  Created by iMac on 9/26/23.
//

import Foundation

struct ExercisesModel : BaseModel{
    var count: Int?
    var next: String?
    var previous: String?
    var results: [ExerciseModel]?
}

struct ExerciseModel : BaseModel,Identifiable {
    var id: Int?
    var uuid, name: String?
    var exerciseBase: Int?
    var description: String?
    var created: String?
    var licenseAuthor: String?
    var variations: [Int]?
    var authorHistory: [String]?
    var images : [ExerciseImageModel]?
    
    enum CodingKeys: String, CodingKey {
        case id
        case uuid, name
        case exerciseBase = "exercise_base_id"
        case description
        case created
        case licenseAuthor = "license_author"
        case variations
        case authorHistory = "author_history"
        case images
    }
}
