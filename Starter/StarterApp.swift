//
//  StarterApp.swift
//  Starter
//
//  Created by iMac on 9/22/23.
//

import SwiftUI

@main
struct StarterApp: App {
    
    var body: some Scene {
        
        let dependencyInjector = ServiceLocator.shared
        dependencyInjector.addService(service: ScreenUtil(width: 428, height: 926))
        
        return WindowGroup {
            HomeScreen()
        }
    }
}
