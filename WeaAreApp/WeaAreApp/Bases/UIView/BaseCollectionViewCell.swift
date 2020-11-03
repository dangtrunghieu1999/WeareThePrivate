//
//  File.swift
//  SoundCloud
//
//  Created by Dang Trung Hieu on 9/23/20.
//  Copyright © 2020 Dang Trung Hieu. All rights reserved.
//

import UIKit

open class BaseCollectionViewCell: UICollectionViewCell, Reusable {
    
    // MARK: - UI Elements
    
    // MARKL - LifeCycles
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        setupDefault()
        initialize()
    }
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupDefault()
        initialize()
    }
    
    override open func awakeFromNib() {
        super.awakeFromNib()
        setupDefault()
        initialize()
    }
    
    // MARK: - Override
    
    // MARK: - Public
    
    public func initialize() {}
    
    // MARK: - Layouts
    
    private func setupDefault() {
        backgroundColor = UIColor.white
    }
   
}

