//
//  ProductDetailViewController.swift
//  WeaAreApp
//
//  Created by admin on 7/15/19.
//  Copyright © 2019 admin. All rights reserved.
//

import UIKit

class ProductDetailViewController: UIViewController {
    
    // MARK: - UI Elements
    
    private lazy var collectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: .zero,
                                              collectionViewLayout: UICollectionViewFlowLayout())
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.backgroundColor = .white
        collectionView.register(ProductDetailCollectionViewCell.self,
                                forCellWithReuseIdentifier: ProductDetailCollectionViewCell.productDetailId)
        collectionView.isPagingEnabled = true
        return collectionView
    }()
    
    private var whiteView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        return view
    }()
    
    private var nameLabel: UILabel = {
        let label = UILabel()
        label.text = "Private Intenational"
        label.font = .systemFont(ofSize: 20, weight: .semibold)
        return label
    }()
    
    private var descriptionLabel: UILabel = {
        let label = UILabel()
        label.text = "Áo Private hai mặt có huy hiệu vàng"
        label.font = .systemFont(ofSize: 13)
        return label
    }()
    
    private var priceLabel: UILabel = {
        let label = UILabel()
        label.text = "120,000 VND"
        label.font = .systemFont(ofSize: 17)
        return label
    }()
    
    private var buyNowButton: UIButton = {
        let button = UIButton()
        button.setTitle("MUA NGAY", for: .normal)
        button.backgroundColor = .black
        return button
    }()
    
    // MARK: - View LifeCycle
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        tabBarController?.tabBar.isHidden = true
        navigationController?.navigationBar.tintColor = .black
        navigationController?.navigationBar.isTranslucent = true
        navigationController?.navigationBar.shadowImage = UIImage()
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .compactPrompt)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(true)
        tabBarController?.tabBar.isHidden = false
        navigationController?.navigationBar.isTranslucent = false
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        layoutCollectionView()
        layoutWhiteView()
        layoutNameLabel()
        layoutDescriptionLabel()
        layoutPriceLabel()
        layoutBuyNowButton()
        setupViewNavigationBar()
    }
    
    // MARK: - SetupNavigationBar
    
    @objc private func touchOnCloseButton() {
       navigationController?.popViewController(animated: true)
    }
    
    private func setupViewNavigationBar() {
        let closeTarget = UIBarButtonItem(image: ImageResources.close, style: .plain, target: self, action: #selector(touchOnCloseButton))
        self.navigationItem.leftBarButtonItem = closeTarget
        
    }
    
    // MARK: - Layout
    
    func layoutCollectionView() {
        view.addSubview(collectionView)
        collectionView.snp.makeConstraints { (make) in
            make.right.left.equalToSuperview()
            make.top.equalToSuperview().offset(20)
            make.height.equalTo(510)
            make.centerX.equalToSuperview()
        }
    }
    
    func layoutWhiteView() {
        let heightView = UIScreen.main.bounds.height - 200
        view.addSubview(whiteView)
        whiteView.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(heightView)
            make.left.right.bottom.equalToSuperview()
        }
    }
    
    func layoutNameLabel() {
        whiteView.addSubview(nameLabel)
        nameLabel.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(50)
            make.centerX.equalToSuperview()
        }
    }
    
    func layoutDescriptionLabel() {
        whiteView.addSubview(descriptionLabel)
        descriptionLabel.snp.makeConstraints { (make) in
            make.centerX.equalToSuperview()
            make.top.equalTo(nameLabel.snp.bottom).offset(4)
        }
    }
    
    func layoutPriceLabel() {
        whiteView.addSubview(priceLabel)
        priceLabel.snp.makeConstraints { (make) in
            make.centerX.equalToSuperview()
            make.top.equalTo(descriptionLabel.snp.bottom).offset(4)
        }
    }
    
    func layoutBuyNowButton() {
        whiteView.addSubview(buyNowButton)
        buyNowButton.snp.makeConstraints { (make) in
            make.left.equalToSuperview().offset(16)
            make.right.equalToSuperview().offset(-16)
            make.top.equalTo(priceLabel.snp.bottom).offset(10)
            make.height.equalTo(50)
        }
    }
    
}
extension ProductDetailViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: collectionView.frame.height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
}
extension ProductDetailViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ProductDetailCollectionViewCell.productDetailId, for: indexPath) as? ProductDetailCollectionViewCell else {
            return UICollectionViewCell()
        }
        return cell
    }
    
    
}
