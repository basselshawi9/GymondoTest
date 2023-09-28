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
        addService(service: ExerciseLocalDataSrouce())
        addService(service: ExerciseViewModel())
        addService(service: NetworkMonitor())
        
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

extension DependencyInjector {
    
    // inject exercise datasource based on network availability
    static func injectExerciseDataSource()-> ExerciseDataSrouce? {
        
        guard let networkMonitor : NetworkMonitor = DependencyInjector.shared.getService() else {
            return nil
        }
        
        if networkMonitor.isConnected {
            guard let remote : ExerciseRemoteDataSrouce = DependencyInjector.shared.getService() else {
                return nil
            }
            return remote
        }
        else {
            guard let local : ExerciseLocalDataSrouce = DependencyInjector.shared.getService() else{
                return nil
            }
            return local
        }
    }
    
}
