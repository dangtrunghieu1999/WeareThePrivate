//
//  BaseCollectionViewHeaderFooterCell.swift
//  WeaAreApp
//
//  Created by Dang Trung Hieu on 11/4/20.
//  Copyright © 2020 admin. All rights reserved.
//


import UIKit

class BaseCollectionViewHeaderFooterCell: UICollectionReusableView, Reusable {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        initialize()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        initialize()
    }
    
    func initialize() {
    }
}

