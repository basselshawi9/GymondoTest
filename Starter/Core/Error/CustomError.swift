//
//  CustomError.swift
//  HaveBreak
//
//  Created by iMac on 5/14/23.
//

import Foundation

class CustomError : Error {
    
    let errorDescription : String
    
    init(errorDescription:String) {
        self.errorDescription = errorDescription
    }
}
