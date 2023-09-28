//
//  UserDefaults.swift
//  Bloc
//
//  Created by iMac on 10/26/22.
//

import Foundation

extension UserDefaults {
    
    @UserDefault(key: "user_name",defaultValue: "")
    static var name: String
   
    @UserDefault(key: "appleLastName")
    static var appleLastName: String?

    
}
