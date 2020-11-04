//
//  ImageCollectionViewCell.swift
//  WeaAreApp
//
//  Created by admin on 7/10/19.
//  Copyright © 2019 admin. All rights reserved.
//

import UIKit

class ImageCollectionViewCell: BaseCollectionViewCell {
    
    // MARK: UI - Elements
    public let photoImageView: UIImageView = {
        let photo = UIImageView()
        photo.translatesAutoresizingMaskIntoConstraints = false
        photo.contentMode = .scaleAspectFill
        return photo
    }()
    
    // MARK: - View LifeCycle
    
    override func initialize() {
        super.initialize()
        layoutPhotoImage()
    }
    
    // MARK: - Public Method
    
    public func configCell(image: UIImage?) {
        self.photoImageView.image = image ?? UIImage(named: "")
    }
    
    // MARK: - Layout
    
    func layoutPhotoImage() {
        addSubview(photoImageView)
        photoImageView.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
    }
    
}
