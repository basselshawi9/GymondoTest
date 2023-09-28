//
//  ActivityEvent.swift
//  Bloc
//
//  Created by iMac on 10/22/22.
//

import Foundation
import CoreLocation

protocol HomeEvent:BaseEvent {
    
}

class GetCountriesEvent:HomeEvent {
    
    static func == (lhs: GetCountriesEvent, rhs: GetCountriesEvent) -> Bool {
        return true
    }
    
}

class GetCitiesEvent:HomeEvent {
    
    static func == (lhs: GetCitiesEvent, rhs: GetCitiesEvent) -> Bool {
        return lhs._param == rhs._param
    }
    
    let _param:GetCitiesParam
     init(param:GetCitiesParam) {
        
        _param = param
    }
}

class GetNumberEvent:HomeEvent {
    
    static func == (lhs: GetNumberEvent, rhs: GetNumberEvent) -> Bool {
        return true
    }
}
