//
//  TextTableViewCell.swift
//  WeaAreApp
//
//  Created by admin on 7/17/19.
//  Copyright © 2019 admin. All rights reserved.
//

import UIKit

class TextTableViewCell: BaseTableViewCell {
        
    // MARK: - UI Elements
    
    private var nameLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .right
        return label
    }()
    
    // MARK: - View LifeCycle
    override func initialize() {
        super.initialize()
        layoutNameLabel()
    }
    
    // MARK: - Layout
    
    func layoutNameLabel() {
        addSubview(nameLabel)
        nameLabel.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
    }
    
    func configCell(with accountLogin: AccountNotLoginedItemType?) {
        nameLabel.text = accountLogin?.rawValue ?? ""
    }
    
}
