//
//  ActivityState.swift
//  Bloc
//
//  Created by iMac on 10/22/22.
//

import Foundation

class HomeState : BaseState {
    
    
    static func == (lhs: HomeState, rhs: HomeState) -> Bool {
        return true
    }
}

class InitialHomeState:HomeState{
    static func == (lhs: InitialHomeState, rhs: InitialHomeState) -> Bool {
        return true
    }
}

class GetCountriesWaitingState:HomeState {
    
    static func == (lhs: GetCountriesWaitingState, rhs: GetCountriesWaitingState) -> Bool {
        return true
    }
    
    
}

class GetCountriesFailureState:HomeState {
    
    static func == (lhs: GetCountriesFailureState, rhs: GetCountriesFailureState) -> Bool {
        return lhs.error.localizedDescription == rhs.error.localizedDescription
    }
    
    let error:Error
    let blocCallBack:()->()
    
    init (error:Error,callBlack:@escaping ()->()) {
        self.error = error
        self.blocCallBack = callBlack
    }
}

class GetCountriesSuccessState:HomeState {
    static func == (lhs: GetCountriesSuccessState, rhs: GetCountriesSuccessState) -> Bool {
        return lhs.model == rhs.model
    }
    
    let model:CountriesModel
    
    init(model:CountriesModel) {
        self.model = model
    }
}

class GetCitiesWaitingState:HomeState {
    
    static func == (lhs: GetCitiesWaitingState, rhs: GetCitiesWaitingState) -> Bool {
        return true
    }
    
    
}

class GetCitiesFailureState:HomeState {
    
    static func == (lhs: GetCitiesFailureState, rhs: GetCitiesFailureState) -> Bool {
        return lhs.error.localizedDescription == rhs.error.localizedDescription
    }
    
    let error:Error
    let blocCallBack:()->()
    
    init (error:Error,callBlack:@escaping ()->()) {
        self.error = error
        self.blocCallBack = callBlack
    }
}

class GetCitiesSuccessState:HomeState {
    static func == (lhs: GetCitiesSuccessState, rhs: GetCitiesSuccessState) -> Bool {
        return lhs.model == rhs.model
    }

    let model:CitiesModel
    
    init(model:CitiesModel) {
        self.model = model
    }
}


class GetNumberWaitingState:HomeState {
    
    static func == (lhs: GetNumberWaitingState, rhs: GetNumberWaitingState) -> Bool {
        return true
    }
    
    
}

class GetNumberFailureState:HomeState {
    
    static func == (lhs: GetNumberFailureState, rhs: GetNumberFailureState) -> Bool {
        return lhs.error.localizedDescription == rhs.error.localizedDescription
    }
    
    let error:Error
    let blocCallBack:()->()
    
    init (error:Error,callBlack:@escaping ()->()) {
        self.error = error
        self.blocCallBack = callBlack
    }
}

class GetNumberSuccessState:HomeState {
    static func == (lhs: GetNumberSuccessState, rhs: GetNumberSuccessState) -> Bool {
        return lhs.model == rhs.model
    }

    let model:Int
    
    init(model:Int) {
        self.model = model
    }
}
