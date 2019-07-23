//
//  ProductModel.swift
//  WeaAreApp
//
//  Created by admin on 7/15/19.
//  Copyright © 2019 admin. All rights reserved.
//

import Foundation

class ProductModel:ProductListModel {
    private (set) var sizes: [ProductSize] = []
}
class ProductSize {
    private (set) var sizeName = ""
    
    init(name: String) {
        self.sizeName = name
    }
    
}
