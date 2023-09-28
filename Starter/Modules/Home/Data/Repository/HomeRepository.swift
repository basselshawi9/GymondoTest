//
//  ActivityRepository.swift
//  Bloc
//
//  Created by iMac on 10/22/22.
//

import Foundation
import Combine
import CoreLocation

class HomeRespository {
    let datasrouce:HomeDataSrouce
    
    init(_datasrouce:HomeDataSrouce) {
        self.datasrouce=_datasrouce
    }
    func getCountries()->Future<CountriesModel,Error> {
        return datasrouce.getCountries()
    }
    
    func getCities(param:GetCitiesParam)->Future<CitiesModel,Error> {
        return datasrouce.getCities(param: param)
    }
}
