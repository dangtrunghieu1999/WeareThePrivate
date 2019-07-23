//
//  AccountLoginViewController.swift
//  WeaAreApp
//
//  Created by admin on 7/17/19.
//  Copyright © 2019 admin. All rights reserved.
//

import UIKit

class AccountLoginViewController: UIViewController {
    
    // MARK: - UI Elements
    
    private var containerView: UIView = {
        let view = UIView()
        view.backgroundColor = .black
        return view
    }()
    
    private var welcomeLabel: UILabel = {
        let label = UILabel()
        label.text = "Welcome to"
        label.font = .systemFont(ofSize: 11)
        label.textColor = .white
        return label
    }()
    
    private var shopNameLabel: UILabel = {
        let label = UILabel()
        label.text = "wearetheprivate"
        label.font = .systemFont(ofSize: 30, weight: .semibold)
        label.textColor = .white
        return label
    }()
    
    private lazy var collectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: .zero,
                                              collectionViewLayout: UICollectionViewFlowLayout())
        collectionView.backgroundColor = .clear
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(AccountSignInCollectionViewCell.self,
                                forCellWithReuseIdentifier: AccountSignInCollectionViewCell.accountSignInId)
        collectionView.register(AccountVipCollectionViewCell.self,
                                forCellWithReuseIdentifier: AccountVipCollectionViewCell.accountVipId)
        return collectionView
    }()
    
        // MARK: - View LifeCycle
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tabBarController?.tabBar.isHidden = true
        navigationController?.navigationBar.isHidden = false
        navigationController?.navigationBar.shadowImage = UIImage()
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationController?.navigationBar.isTranslucent = true
        navigationController?.navigationBar.barStyle = .black
    
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        tabBarController?.tabBar.isHidden = false
        navigationController?.navigationBar.barStyle = .default
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupBarButton()
        layoutContainerView()
        layoutWelcomeLabel()
        layoutShopNameLabel()
        layoutCollectionView()
    }
    
    // MARK: - SetupView
    
    @objc private func touchOnBackButton() {
        navigationController?.popViewController(animated: true)
    }
    
    func setupBarButton() {
        let backButtonITem = UIBarButtonItem(image: ImageResources.back, style: .plain, target: self, action: #selector(touchOnBackButton))
        self.navigationItem.leftBarButtonItem = backButtonITem
        navigationController?.navigationBar.tintColor = .white
        
    }
    
    // MARK: - Layout
    
    func layoutContainerView() {
        view.addSubview(containerView)
        containerView.snp.makeConstraints { (make) in
            make.top.left.right.equalToSuperview()
            make.height.equalTo(190)
        }
    }
    
    func layoutWelcomeLabel() {
        view.addSubview(welcomeLabel)
        welcomeLabel.snp.makeConstraints { (make) in
            if #available(iOS 11, *) {
                make.top.equalTo(view.safeAreaLayoutGuide).offset(4)
            }
            else {
                make.top.equalTo(topLayoutGuide.snp.bottom).offset(4)
            }
            make.left.equalToSuperview().offset(19)
        }
    }
    
    func layoutShopNameLabel() {
        containerView.addSubview(shopNameLabel)
        shopNameLabel.snp.makeConstraints { (make) in
            make.left.equalTo(welcomeLabel.snp.left)
            make.top.equalTo(welcomeLabel.snp.bottom)
        }
    }
    
    func layoutCollectionView() {
        view.addSubview(collectionView)
        collectionView.snp.makeConstraints { (make) in
            make.left.right.bottom.equalToSuperview()
            make.top.equalToSuperview().offset(158)
        }
    }
}

extension AccountLoginViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if indexPath.section == 0 {
            return CGSize(width: collectionView.frame.width, height: 208)
        } else {
            return CGSize(width: collectionView.frame.width, height: 360)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
}

extension AccountLoginViewController: UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if indexPath.section == 0 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: AccountSignInCollectionViewCell.accountSignInId, for: indexPath)
            return cell
        } else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: AccountVipCollectionViewCell.accountVipId, for: indexPath)
            return cell
        }
        
    }
    
    
}



