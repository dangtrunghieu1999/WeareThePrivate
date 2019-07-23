//
//  PolicyTableViewCell.swift
//  WeaAreApp
//
//  Created by admin on 7/17/19.
//  Copyright © 2019 admin. All rights reserved.
//

import UIKit

class PolicyTableViewCell: UITableViewCell {
    
    public static let policyCellId = "PolicyTableViewCell"
    
    private var logoImage: UIImageView = {
        let image = UIImageView()
        image.clipsToBounds = true
        image.contentMode = .scaleAspectFit
        image.image = UIImage(named: "Paypal")
        return image
    }()
    
    private var detailLabel: UILabel = {
        let label = UILabel()
        let attributedString = NSMutableAttributedString(string: "Được xem trước những collection mới nhất và được Vote và đặt hàng sớm")
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineSpacing = 5
        paragraphStyle.alignment = .center
        attributedString.addAttribute(NSAttributedString.Key.paragraphStyle,
                                      value: paragraphStyle,
                                      range:NSMakeRange(0, attributedString.length))
        label.attributedText = attributedString
        label.numberOfLines = 3
        label.font = .systemFont(ofSize: 12)
        label.textColor = .gray
        label.textAlignment = .left
        return label
    }()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        layoutLogoImage()
        layoutDetailLabel()
        
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        layoutLogoImage()
        layoutDetailLabel()
    }
    
    // MARK: - Layout
    
    func layoutLogoImage() {
        addSubview(logoImage)
        logoImage.snp.makeConstraints { (make) in
            make.left.equalToSuperview().offset(16)
            make.width.height.equalTo(50)
            make.centerY.equalToSuperview()
        }
    }
    
    func layoutDetailLabel() {
        addSubview(detailLabel)
        detailLabel.snp.makeConstraints { (make) in
            make.left.equalTo(logoImage.snp.right).offset(4)
            make.centerY.equalTo(logoImage)
            make.right.equalToSuperview().offset(-30)
        }
    }
    
}
