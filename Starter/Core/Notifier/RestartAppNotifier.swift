//
//  RestartAppNotifier.swift
//  HaveBreak
//
//  Created by iMac on 3/16/23.
//

import Foundation
import Combine

class RestartAppNotifier {
    
    let restartPublisher = PassthroughSubject<Bool,Never>()
    var cancelables = Set<AnyCancellable>()
}
