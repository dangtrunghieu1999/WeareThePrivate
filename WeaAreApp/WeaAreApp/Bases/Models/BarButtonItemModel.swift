//
//  BarButtonItemModels.swift
//  WeaAreApp
//
//  Created by admin on 7/13/19.
//  Copyright © 2019 admin. All rights reserved.
//

import UIKit

enum BarButtonItemType {
    case left
    case right
}
typealias Target = (target: Any?, selector: Selector)

class BarButtonItemModel {
    var image: UIImage?
    var name: String?
    var target: Target
    
    init(_ image: UIImage?, _ target: Target) {
        self.image = image
        self.target = target
    }
    
    init(_ image: UIImage?, _ name: String?, target: Target) {
        self.image = image
        self.name = name
        self.target = target
    }
}

