//
//  CountryModel.swift
//  HaveBreak
//
//  Created by iMac on 2/1/23.
//

import Foundation

struct CountriesModel : BaseModel {
    var error: Bool
    var msg: String
    var data: [CountryModel]
}

struct CountryModel : BaseModel{
    var name: String
    var flag: String
    var iso2, iso3: String
}
