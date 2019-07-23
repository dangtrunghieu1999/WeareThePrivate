//
//  CartTableViewCell.swift
//  WeaAreApp
//
//  Created by admin on 7/15/19.
//  Copyright © 2019 admin. All rights reserved.
//

import UIKit

class CartTableViewCell: UITableViewCell {
    // MARK: - Properties
    public static let cartCellID = "CartTableViewCell"
    // MARK: - UI Elements
    
    private var imageProductView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "ProductImage")
        imageView.contentMode = .scaleToFill
        return imageView
    }()
    
    private var categoryProductLabel: UILabel = {
        let label = UILabel ()
        label.text = "QUẦN JOGER THEO BỘ"
        label.font = .systemFont(ofSize: 17, weight: .semibold)
        return label
    }()
    
    private var colorProductLabel: UILabel = {
        let label = UILabel()
        label.text = "Màu đen Mã SS12323"
        label.font = .systemFont(ofSize: 11)
        return label
    }()
    
    private var sizeProductLabel: UILabel = {
        let label = UILabel()
        label.text = "S"
        label.font = .systemFont(ofSize: 17, weight: .bold)
        return label
    }()
    
    private var priceProductLabel: UILabel = {
        let label = UILabel()
        label.text = "170,000 VND"
        label.font = .systemFont(ofSize: 14)
        return label
    }()
    
    // MARK: - View LifeCycle
    
    override func awakeFromNib() {
        super.awakeFromNib()
        layoutImageProductView()
        layoutCategoryProductLabel()
        layoutColorProductLabel()
        layoutSizeProductLabel()
        layoutPriceProductLabel()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        layoutImageProductView()
        layoutCategoryProductLabel()
        layoutColorProductLabel()
        layoutSizeProductLabel()
        layoutPriceProductLabel()
    }
    
    // MARK: - Layout
    
    func layoutImageProductView() {
        contentView.addSubview(imageProductView)
        imageProductView.snp.makeConstraints { (make) in
            make.left.equalToSuperview().offset(30)
            make.top.equalToSuperview().offset(10)
            make.width.equalTo(115)
            make.height.equalTo(168)
        }
    }
    
    func layoutCategoryProductLabel() {
        contentView.addSubview(categoryProductLabel)
        categoryProductLabel.snp.makeConstraints { (make) in
            make.left.equalTo(imageProductView.snp.right).offset(16)
            make.top.equalToSuperview().offset(20)
        }
    }
    
    func layoutColorProductLabel() {
        contentView.addSubview(colorProductLabel)
        colorProductLabel.snp.makeConstraints { (make) in
            make.left.equalTo(categoryProductLabel.snp.left)
            make.top.equalTo(categoryProductLabel.snp.bottom).offset(4)
        }
    }
    
    func layoutSizeProductLabel() {
        contentView.addSubview(sizeProductLabel)
        sizeProductLabel.snp.makeConstraints { (make) in
            make.left.equalTo(categoryProductLabel.snp.left)
            make.top.equalTo(colorProductLabel.snp.bottom).offset(16)
        }
    }
    
    func layoutPriceProductLabel() {
        contentView.addSubview(priceProductLabel)
        priceProductLabel.snp.makeConstraints { (make) in
            make.left.equalTo(categoryProductLabel.snp.left)
            make.top.equalTo(sizeProductLabel.snp.bottom).offset(49)
        }
    }
    
    
}
