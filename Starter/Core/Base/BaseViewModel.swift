//
//  BaseBloc.swift
//  Bloc
//
//  Created by iMac on 10/25/22.
//

import Foundation
import Combine
import SwiftUI


protocol BaseEvent: AnyObject,Equatable {
    
}

protocol BaseState: AnyObject,Equatable {
    
}

class EmptyState : BaseState {
    
    static func == (lhs: EmptyState, rhs: EmptyState) -> Bool {
        true
    }
    
    var isNew: Bool=true
    
}

protocol BaseViewModel : ObservableObject {
    func addEvent<BaseEvent>(event:BaseEvent)
}

class ViewModelState : ObservableObject {
    @Published var state:(any BaseState)?
}
