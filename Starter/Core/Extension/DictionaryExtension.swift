//
//  DictionaryExtension.swift
//  HaveBreak
//
//  Created by iMac on 5/25/23.
//

import Foundation

extension Dictionary {
    mutating func lowercaseKeys() {
        for key in self.keys {
            let str = (key as! String).lowercased()
            self[str as! Key] = self.removeValue(forKey:key)
        }
    }
}
