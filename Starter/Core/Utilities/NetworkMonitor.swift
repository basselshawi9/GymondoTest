//
//  NetworkMonitor.swift
//  Starter
//
//  Created by iMac on 9/27/23.
//

import Foundation
import Network
import Combine

class NetworkMonitor {
    static let shared = NetworkMonitor()

    let monitor = NWPathMonitor()
    private var status: NWPath.Status = .requiresConnection
    @Published var isReachable: Bool = true
    var isReachableOnCellular: Bool = true
    
    var cancelables = Set<AnyCancellable>()
    

    func startMonitoring() {
        monitor.pathUpdateHandler = { [weak self] path in
            self?.status = path.status
            self?.isReachableOnCellular = path.isExpensive

            if path.status == .satisfied {
                self?.isReachable = true
            } else {
                self?.isReachable = false
            }
        }

        let queue = DispatchQueue(label: "NetworkMonitor")
        monitor.start(queue: queue)
    }

    func stopMonitoring() {
        monitor.cancel()
    }
}
