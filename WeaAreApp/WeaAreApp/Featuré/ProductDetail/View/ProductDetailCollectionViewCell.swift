//
//  ProductDetailCollectionViewCell.swift
//  WeaAreApp
//
//  Created by admin on 7/15/19.
//  Copyright © 2019 admin. All rights reserved.
//

import UIKit

class ProductDetailCollectionViewCell: UICollectionViewCell {
    
    public static let  productDetailId = "ProductDetailCollectionViewCell"
    
    private var productImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFill
        imageView.image = UIImage(named: "Shirt")
        return imageView
    }()
    
    // MAKR: - View LifeCycle
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        layoutProductImage()
        
    }
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
    }
    
    override open func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    func layoutProductImage() {
        addSubview(productImageView)
        productImageView.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
    }
}
