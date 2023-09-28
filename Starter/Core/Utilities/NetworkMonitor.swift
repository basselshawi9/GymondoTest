//
//  NetworkMonitor.swift
//  Starter
//
//  Created by iMac on 9/28/23.
//

import Foundation
import Network

final class NetworkMonitor: ObservableObject {

    static let shared = NetworkMonitor()
    let queue = DispatchQueue(label: "NetworkMonitor")
    let monitor = NWPathMonitor()
    @Published public private(set) var isConnected: Bool = false
    private var hasStatus: Bool = false
    
    init() {
        monitor.pathUpdateHandler = { path in
            #if targetEnvironment(simulator)
                if (!self.hasStatus) {
                    self.isConnected = path.status == .satisfied
                    self.hasStatus = true
                } else {
                    self.isConnected = !self.isConnected
                }
            #else
                self.isConnected = path.status == .satisfied
            #endif
        }
        monitor.start(queue: queue)
    }

}
