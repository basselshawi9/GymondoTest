//
//  ExerciseImagesModel.swift
//  Starter
//
//  Created by iMac on 9/26/23.
//

import Foundation

struct ExerciseImageModel : BaseModel,Identifiable{
    var id: Int?
    var uuid: String?
    var exerciseBase: Int?
    var exerciseBaseUUID: String?
    var image: String?
    var isMain: Bool?
    var style: String?
    var license: Int?
    var licenseTitle, licenseObjectURL, licenseAuthor, licenseAuthorURL: String?
    var licenseDerivativeSourceURL: String?
    
    enum CodingKeys: String, CodingKey {
        case id
        case uuid
        case exerciseBase = "exercise_base"
        case exerciseBaseUUID = "exercise_base_uuid"
        case image
        case isMain = "is_main"
        case style
        case license
        case licenseTitle = "license_title"
        case licenseObjectURL = "license_object_url"
        case licenseAuthor = "license_author"
        case licenseAuthorURL = "license_author_url"
        case licenseDerivativeSourceURL = "license_derivative_source_url"
    }
}
