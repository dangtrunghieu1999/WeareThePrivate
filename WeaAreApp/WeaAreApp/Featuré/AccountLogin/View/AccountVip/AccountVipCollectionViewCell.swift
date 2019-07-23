//
//  AccountVipCollectionViewCell.swift
//  WeaAreApp
//
//  Created by admin on 7/17/19.
//  Copyright © 2019 admin. All rights reserved.
//

import UIKit

class AccountVipCollectionViewCell: UICollectionViewCell {
    
    public static let accountVipId = "AccountVipCollectionViewCell"
    
    
    private var containerView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.makeShadowAndCorner(cornerRadius: 13,
                                 shadowRadius: 3,
                                 shadowColor: UIColor.black.cgColor,
                                 shadowOffset: CGSize(width: 1, height: 1), shadowOpacity: 0.3)
        return view
    }()
    
    private var passVipLabel: UILabel = {
        let label = UILabel()
        label.text = "Trở thành VIP của wearetheprivate"
        label.font = .systemFont(ofSize: 12)
        return label
    }()
    
    private var descriptionLabel: UILabel = {
        let label = UILabel()
        label.text = "Rất nhiều ưu đãi chỉ những thành viên VIP được nhận"
        label.textColor = .gray
        label.font = .systemFont(ofSize: 12)
        label.numberOfLines = 0
        label.textAlignment = .center
        return label
    }()
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(PolicyTableViewCell.self,
                           forCellReuseIdentifier: PolicyTableViewCell.policyCellId)
        return tableView
    }()
    
    // MAKR: - View LifeCycle
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        layoutContainerView()
        layoutPassVipLabel()
        layoutDescription()
        layoutTablView()
    }
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        layoutContainerView()
        
    }
    
    override open func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    // MARK: - Layout
    
    func layoutContainerView(){
        addSubview(containerView)
        containerView.snp.makeConstraints { (make) in
            make.bottom.equalToSuperview().offset(5)
            make.left.equalToSuperview().offset(17)
            make.right.equalToSuperview().offset(-17)
            make.top.equalToSuperview().offset(17)
        }
    }
    
    func layoutPassVipLabel() {
        containerView.addSubview(passVipLabel)
        passVipLabel.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(20)
            make.centerX.equalToSuperview()
        }
    }
    
    func layoutDescription() {
        containerView.addSubview(descriptionLabel)
        descriptionLabel.snp.makeConstraints { (make) in
            make.top.equalTo(passVipLabel.snp.bottom).offset(4)
            make.centerX.equalToSuperview()
            make.width.equalToSuperview()
        }
    }
    func layoutTablView(){
        containerView.addSubview(tableView)
        tableView.snp.makeConstraints { (make) in
            make.top.equalTo(descriptionLabel.snp.bottom).offset(12)
            make.left.right.equalToSuperview()
            make.height.equalTo(220)
        }
    }
    
}

extension AccountVipCollectionViewCell: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 72
    }
}
extension AccountVipCollectionViewCell: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: PolicyTableViewCell.policyCellId, for: indexPath) as? PolicyTableViewCell else {
            return UITableViewCell()
        }
        cell.selectionStyle = .none
        
        return cell
    }
    
    
}
