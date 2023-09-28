//
//  AppDelegate.swift
//  Starter
//
//  Created by iMac on 9/27/23.
//

import Foundation
import UIKit
import SwiftUI

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow(frame: UIScreen.main.bounds)
        if #available(iOS 16.0, *) {
            window?.rootViewController = UIHostingController(rootView: NavigationStack {
                ExercisesScreen()
            })
        } else {
            
            window?.rootViewController = UIHostingController(rootView: NavigationView {
                ExercisesScreen()
            })
        }
        window?.makeKeyAndVisible()
        return true
    }
}
