//
//  BaseTableViewHeaderFooter.swift
//  WeaAreApp
//
//  Created by Dang Trung Hieu on 11/4/20.
//  Copyright © 2020 admin. All rights reserved.
//

import UIKit

class BaseTableViewHeaderFooter: UITableViewHeaderFooterView, Reusable {
    
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        isUserInteractionEnabled = true
        initialize()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    func initialize() {}
    
}

