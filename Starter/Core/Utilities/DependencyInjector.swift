//
//  DependencyInjector.swift
//  Bloc
//
//  Created by iMac on 10/22/22.
//

import Foundation


class DependencyInjector {
    
    static private let _shared = DependencyInjector()
    
    private init(){
        
        addService(service: ExerciseRemoteDataSrouce())
        addService(service: ExerciseViewModel())
        
        // Notifiers
        addService(service: RestartAppNotifier())
        
    }
    

    static var shared:DependencyInjector {
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
