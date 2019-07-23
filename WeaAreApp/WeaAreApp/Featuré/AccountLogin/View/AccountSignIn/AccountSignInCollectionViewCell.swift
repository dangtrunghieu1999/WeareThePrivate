//
//  AccountSignInCollectionViewCell.swift
//  WeaAreApp
//
//  Created by admin on 7/17/19.
//  Copyright © 2019 admin. All rights reserved.
//

import UIKit

class AccountSignInCollectionViewCell: UICollectionViewCell {
    
    // MARK: - Properties
    
    public static let accountSignInId = "AccountSignInCollectionViewCell"
   
   
    
    // MARK: - UI Elements
    
    private var containerView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.makeShadowAndCorner(cornerRadius: 13, shadowRadius: 3, shadowColor: UIColor.black.cgColor, shadowOffset: CGSize(width: 1, height: 1), shadowOpacity: 0.3)
        return view
    }()
    
    private var signInMemeberLabel: UILabel = {
        let label = UILabel()
        label.text = "Đăng ký thành viên"
        label.font = .systemFont(ofSize: 17)
        return label
    }()
    
    private var contentLabel: UILabel = {
        let label = UILabel()
        let attributedString = NSMutableAttributedString(string: "Đăng ký ngay để trở thành member của thePrivate và \nnhận nhiều phần quà và ưu đãi đặc quyền nhé")
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineSpacing = 5
        paragraphStyle.alignment = .center
        attributedString.addAttribute(NSAttributedString.Key.paragraphStyle,
                                      value: paragraphStyle,
                                      range:NSMakeRange(0, attributedString.length))
        label.attributedText = attributedString
        label.numberOfLines = 0
        label.font = .systemFont(ofSize: 12)
        label.textColor = .gray
        return label
    }()
    
    private var joinNowButton: UIButton = {
        let button = UIButton()
        button.setTitle("Tham gia ngay", for: .normal)
        button.backgroundColor = .black
        button.layer.cornerRadius = 11
        
        return button
    }()
    
    private var descriptionAccountLabel: UILabel = {
        let label = UILabel()
        label.text = "Bạn đã có tài khoản chưa? "
        label.font = .systemFont(ofSize: 11)
        return label
    }()
    
    private var signInButton: UIButton = {
        let button = UIButton()
        var attrs = [
            NSAttributedString.Key.font : UIFont.systemFont(ofSize: 11.0),
            NSAttributedString.Key.foregroundColor : UIColor.black,
            NSAttributedString.Key.underlineStyle : 1] as [NSAttributedString.Key : Any]
        
        var attributedString = NSMutableAttributedString(string:"")
        
        let buttonTitleStr = NSMutableAttributedString(string:"Đăng nhập", attributes:attrs)
        attributedString.append(buttonTitleStr)
        button.setAttributedTitle(attributedString, for: .normal)
        
        return button
    }()
    
    // MAKR: - View LifeCycle
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        layoutContainerView()
        layoutSignInMemberLabel()
        layoutContentLabel()
        layoutJoinNowButton()
        layoutDescriptionAccountLabel()
        layoutSignInButton()
        
    }
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    
    }
    
    override open func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    func layoutContainerView() {
        addSubview(containerView)
        containerView.snp.makeConstraints { (make) in
            make.left.equalToSuperview().offset(17)
            make.right.equalToSuperview().offset(-17)
            make.top.bottom.equalToSuperview().offset(5)
        }
    }
    
    func layoutSignInMemberLabel() {
        containerView.addSubview(signInMemeberLabel)
        signInMemeberLabel.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(19)
            make.centerX.equalToSuperview()
        }
    }
    
    func layoutContentLabel() {
        containerView.addSubview(contentLabel)
        contentLabel.snp.makeConstraints { (make) in
            make.top.equalTo(signInMemeberLabel.snp.bottom).offset(4)
            make.centerX.equalToSuperview()
            make.width.equalToSuperview()
        }
    }
    
    func layoutJoinNowButton() {
        containerView.addSubview(joinNowButton)
        joinNowButton.snp.makeConstraints { (make) in
            make.top.equalTo(contentLabel.snp.bottom).offset(22)
            make.centerX.equalToSuperview()
            make.height.equalTo(45)
            make.width.equalTo(158)
        }
    }
    
    func layoutDescriptionAccountLabel() {
        containerView.addSubview(descriptionAccountLabel)
        descriptionAccountLabel.snp.makeConstraints { (make) in
            make.centerX.equalToSuperview().offset(-42)
            make.top.equalTo(joinNowButton.snp.bottom).offset(8)
        }
    }
    
    func layoutSignInButton() {
        containerView.addSubview(signInButton)
        signInButton.snp.makeConstraints { (make) in
            make.left.equalTo(descriptionAccountLabel.snp.right).offset(7)
            make.top.equalTo(descriptionAccountLabel.snp.top)
            make.centerY.equalTo(descriptionAccountLabel)
        }
    }
}
