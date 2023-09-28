//
//  ActivityBloc.swift
//  Bloc
//
//  Created by iMac on 10/22/22.
//

import Foundation
import Combine

class HomeViewModel : BaseViewModel {
        
    var countriesState = CurrentValueSubject<any BaseState,Never>(InitialHomeState())
    
    var numberState = CurrentValueSubject<any BaseState,Never>(InitialHomeState())
    
    private var number = 0
    
    var cancelables : Set<AnyCancellable> = []
    
    func addEvent<HomeEvent>(event: HomeEvent) {
        if let getCountriesEvent = event as? GetCountriesEvent {
            mapGetCountriesEvent(event: getCountriesEvent)
        }
        else if let getNumberEvent = event as? GetNumberEvent {
            mapGetNumberEvent(event: getNumberEvent)
        }
    }
    
    private func mapGetCountriesEvent(event:GetCountriesEvent) {
        countriesState.send(GetCountriesWaitingState())
        if let _repository : HomeRespository = ServiceLocator.shared.getService() {
            
            _repository.getCountries().receive(on: DispatchQueue.main).sink { completion in
                switch completion {
                case .failure(let err):
                    self.countriesState.send(GetCountriesFailureState(error: err) {
                        
                    })
                    break
                case .finished:
                    break
                }
                
            } receiveValue: { model in
                self.countriesState.send(GetCountriesSuccessState(model: model))
                
            }.store(in: &cancelables)
        }
    }
    private func mapGetNumberEvent(event:GetNumberEvent) {
        numberState.send(GetNumberSuccessState(model: number))
        number += 1
    }
}
