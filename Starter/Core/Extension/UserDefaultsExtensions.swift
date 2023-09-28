//
//  UserDefaults.swift
//  Bloc
//
//  Created by iMac on 10/26/22.
//

import Foundation

extension UserDefaults {
    
    @UserDefault(key: "cachedExercises")
    static var cachedExercises: String?    
}
