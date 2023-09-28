//
//  GetCitiesParam.swift
//  HaveBreak
//
//  Created by iMac on 2/1/23.
//

import Foundation

class GetCitiesParam: BaseParam {
    static func == (lhs: GetCitiesParam, rhs: GetCitiesParam) -> Bool {
        return lhs._country == rhs._country
    }
    
    private let _country:String
    
    init(country:String?) {
        _country = country ?? ""
    }
    
    var jsonObject: Dictionary<String, Any> {
        get {
            return ["country":_country]
        }
    }
    
}
