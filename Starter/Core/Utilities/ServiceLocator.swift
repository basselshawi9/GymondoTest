//
//  ServiceLocator.swift
//  Bloc
//
//  Created by iMac on 10/22/22.
//

import Foundation


class ServiceLocator {
    
    static private let _shared = ServiceLocator()
    
    private init(){
        
        addService(service: HomeRemoteDataSource())
        let homeDataSrouce : HomeRemoteDataSource? = getService()
        if let _homeDataSrouce = homeDataSrouce {
            addService(service: HomeRespository(_datasrouce: _homeDataSrouce))
        }
        addService(service: HomeViewModel())
        
        // Notifiers
        addService(service: RestartAppNotifier())
        
    }
    

    static var shared:ServiceLocator {
        get {
            return _shared
        }
    }
    
    private lazy var reg: [String: AnyObject] = [:]
    func addService<T>(service: T) {
        let key = "\(type(of: service))"
        reg[key] = service as AnyObject
    }
    
    func getService<T>() -> T? {
        let key = "\(T.self)"
        return reg[key] as? T
    }
    
}
