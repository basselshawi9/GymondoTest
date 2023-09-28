//
//  Common.swift
//  HaveBreak
//
//  Created by iMac on 2/20/23.
//

import Foundation
import Alamofire
import UIKit
import SwiftUI
import AVFoundation


func NO_AUTHORIZATION_HEADER() -> HTTPHeaders{
    return ["Content-Type": "application/json; charset=utf-8"]
}

func AUTHORIZATION_HEADER() -> HTTPHeaders{
    
    let token = ""
    return ["Authorization":"Bearer \(token)",
            "Content-Type": "application/json; charset=utf-8"]
}
