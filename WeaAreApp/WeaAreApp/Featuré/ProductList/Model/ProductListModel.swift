//
//  File.swift
//  WeaAreApp
//
//  Created by admin on 7/11/19.
//  Copyright © 2019 admin. All rights reserved.
//

import UIKit

enum ProductListType {
    case normal
    case medium
    case large
}

class ProductListModel {
    private (set) var image: UIImage? = UIImage(named: "ProductImage")
    private (set) var name = ""
    private (set) var price: CGFloat = 0
    private (set) var type: ProductListType = .normal
    
    init() {
    }
    init(_ type: ProductListType) {
        self.type = type
    }
}
