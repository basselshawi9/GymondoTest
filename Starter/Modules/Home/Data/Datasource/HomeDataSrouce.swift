//
//  ActivityDataSrouce.swift
//  Bloc
//
//  Created by iMac on 10/22/22.
//

import Foundation
import Combine

protocol HomeDataSrouce  {
    
    func getCountries()->Future<CountriesModel,Error>
    func getCities(param:GetCitiesParam)->Future<CitiesModel,Error>
    
}
