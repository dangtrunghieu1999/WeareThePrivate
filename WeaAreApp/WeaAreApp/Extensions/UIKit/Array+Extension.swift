//
//  Array.swift
//  WeaAreApp
//
//  Created by Dang Trung Hieu on 3/7/21.
//  Copyright © 2021 admin. All rights reserved.
//

import Foundation

extension Array {
    subscript(safe index: Int) -> Element? {
        if index < count && index >= 0 {
            return self[index]
        } else {
            return nil
        }
    }
}
