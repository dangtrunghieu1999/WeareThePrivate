//
//  BaseTableViewCell.swift
//  SoundCloud
//
//  Created by Dang Trung Hieu on 9/23/20.
//  Copyright © 2020 Dang Trung Hieu. All rights reserved.
//

import UIKit

open class BaseTableViewCell: UITableViewCell, Reusable {
    public override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupDefault()
        initialize()
    }
    
    open override func awakeFromNib() {
        super.awakeFromNib()
        setupDefault()
        initialize()
    }
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupDefault()
        initialize()
    }
    
    public func initialize() {}
    
    private func setupDefault() {
        selectionStyle = .none
        backgroundColor = UIColor.white
    }
}
