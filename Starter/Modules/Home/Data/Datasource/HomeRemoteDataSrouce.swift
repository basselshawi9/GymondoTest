//
//  ActivityRemoteDataSrouce.swift
//  Bloc
//
//  Created by iMac on 10/22/22.
//

import Foundation
import Combine
import Alamofire

class HomeRemoteDataSource: HomeDataSrouce {
    
    func getCities(param: GetCitiesParam) -> Future<CitiesModel, Error> {
        return APIService.shared.apiRequest(converter: CitiesModel.self, url: getCitiesApis, method: HTTPMethod.post, parameter: param.jsonObject as Parameters, encoder: JSONEncoding.default, headers: NO_AUTHORIZATION_HEADER())
    }
    
    func getCountries() -> Future<CountriesModel, Error> {
        return APIService.shared.apiRequest(converter: CountriesModel.self, url: getCountriesApis, method: HTTPMethod.get, parameter: nil, encoder: URLEncoding.default, headers: NO_AUTHORIZATION_HEADER())
    }
}
