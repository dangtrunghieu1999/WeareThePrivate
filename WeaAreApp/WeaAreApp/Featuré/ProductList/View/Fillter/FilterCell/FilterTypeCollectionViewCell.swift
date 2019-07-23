//
//  FilterTypeCollectionViewCell.swift
//  WeaAreApp
//
//  Created by admin on 7/12/19.
//  Copyright © 2019 admin. All rights reserved.
//

import UIKit

class FilterTypeCollectionViewCell: UICollectionViewCell {
    
    public static let filterId = "filterTypeCollectionViewCell"
    
    // MAKR: - UIElements
    
    private let filterTypeLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 13)
        return label
    }()
    
    
    // MARK: - View LifeCycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        layoutFilterTypeLabel()
        
    }
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        layoutFilterTypeLabel()
    }
    // MARK: - Layout
    
    func layoutFilterTypeLabel() {
        addSubview(filterTypeLabel)
        filterTypeLabel.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
    }
    
    func configCell(with filterType: FilterType?) {
        filterTypeLabel.text = filterType?.rawValue ?? ""
    }
}
