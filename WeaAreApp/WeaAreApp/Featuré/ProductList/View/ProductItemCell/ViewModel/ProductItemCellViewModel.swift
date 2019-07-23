//
//  ProductItemCellModel.swift
//  WeaAreApp
//
//  Created by admin on 7/12/19.
//  Copyright © 2019 admin. All rights reserved.
//

import UIKit

class ProductItemCellViewModel {
    
    // MARK: Helper
    
    private let itemSpacing: CGFloat = 12
    private let sectionSpacing: CGFloat = 49
    private let normalImageRatio: CGFloat  = 1.493
    private let mediumImageRatio: CGFloat = 0.731
    private let labelHeight: CGFloat = 34
    private let margin: CGFloat = 20
    
    private var normalItemSize: CGSize {
        let width = (UIScreen.main.bounds.width - itemSpacing) / 2
        let height = width * normalImageRatio + labelHeight + margin + sectionSpacing
        return CGSize(width: width, height: height)
    }
    
    private var mediumItemSize: CGSize {
        let width = UIScreen.main.bounds.width
        let height = width * mediumImageRatio + labelHeight + margin + sectionSpacing
        return CGSize(width: width, height: height)
    }
    
    private var largeItemSize: CGSize {
        let width = UIScreen.main.bounds.width
        let height = width * normalImageRatio + labelHeight + margin + sectionSpacing
        return CGSize(width: width, height: height)
    }
    
    private var productListModel = ProductListModel()
    
    // MARK: Init
    
    init(with productListModel: ProductListModel) {
        self.productListModel = productListModel
    }
    
    // MARK: Getter
    
    var image: UIImage? {
        return productListModel.image
    }
    
    var name: String {
        return productListModel.name
    }
    
    var price: String {
        return productListModel.price.description
    }
    
    var size: CGSize {
        switch productListModel.type {
        case .normal:
            return normalItemSize
        case .medium:
            return mediumItemSize
        case .large:
            return largeItemSize
        }
    }
    
    var minimumItemSpacing: CGFloat {
        return itemSpacing
    }
    
}
