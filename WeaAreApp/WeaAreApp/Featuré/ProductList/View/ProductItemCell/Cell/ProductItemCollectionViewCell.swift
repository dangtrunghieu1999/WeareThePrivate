//
//  ProductItemCollectionViewCell.swift
//  WeaAreApp
//
//  Created by admin on 7/12/19.
//  Copyright © 2019 admin. All rights reserved.
//

import UIKit

class ProductItemCollectionViewCell: UICollectionViewCell {
    
    // MARK: - UI Elements
    public static let productItemCellId = "productItemCollectionViewCell"
    
    private var productImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFill
        imageView.image = UIImage(named: "ProductImage")
        return imageView
    }()
    
    private var nameLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 15, weight: .bold)
        label.text = "Private International"
        return label
    }()
    
    private var priceLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 15)
        label.text = "699.000 VND"
        return label
    }()
    
    // MAKR: - View LifeCycle
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        layoutProductImage()
        layoutNameLabel()
        layoutPriceLabel()
    }
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
    }
    
    override open func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    // MARK: - Layout
    
    func layoutProductImage() {
        addSubview(productImageView)
        productImageView.snp.makeConstraints { (make) in
           make.top.left.right.equalToSuperview()
        }
    }
    
    func layoutNameLabel() {
        addSubview(nameLabel)
        nameLabel.snp.makeConstraints { (make) in
            make.top.equalTo(productImageView.snp.bottom).offset(11)
            make.left.equalToSuperview().offset(7)
        }
    }
    
    func layoutPriceLabel() {
        addSubview(priceLabel)
        priceLabel.snp.makeConstraints { (make) in
            make.top.equalTo(nameLabel.snp.bottom).offset(4)
            make.left.equalToSuperview().offset(7)
        }
    }
    
}
