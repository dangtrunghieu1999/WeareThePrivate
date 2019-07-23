//
//  ProductListedViewController.swift
//  WeaAreApp
//
//  Created by admin on 7/11/19.
//  Copyright © 2019 admin. All rights reserved.
//

import UIKit

class ProductListedViewController: UIViewController{
    
    
    // MARK: - Properties
    
    private lazy var viewModel: ProductListViewModel = {
        let viewModel = ProductListViewModel()
        viewModel.delegate = self
        return viewModel
    }()
    
    // MARK: - UI Elements
    
    private lazy var collectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: .zero,
                                              collectionViewLayout: UICollectionViewFlowLayout())
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.backgroundColor = .white
        collectionView.register(ProductItemCollectionViewCell.self, forCellWithReuseIdentifier: ProductItemCollectionViewCell.productItemCellId)
        return collectionView
    }()
    
    private let filterTypeView: FilterTypeView = {
        let view = FilterTypeView()
        view.backgroundColor = .white
        return view
    }()
    
    
    // MARK: - View LifeCycle
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        tabBarController?.tabBar.isHidden = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(true)
        tabBarController?.tabBar.isHidden = false
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        title = "SS19"
        layoutFilterTypeView()
        layoutCollectionView()
        setupFilterTypeView()
        viewModel.viewDidLoad()
        setupBarButton()
    }
    
    // MARK: - SetupView
    
    @objc private func touchOnBackButton() {
        navigationController?.popViewController(animated: true)
    }
    
    @objc private func touchOnNextButton() {
        let cart = CartViewController()
        navigationController?.pushViewController(cart, animated: true)
    }
    
    func setupBarButton() {
        let backButtonITem = UIBarButtonItem(image: ImageResources.back, style: .plain, target: self, action: #selector(touchOnBackButton))
        self.navigationItem.leftBarButtonItem = backButtonITem
        navigationController?.navigationBar.tintColor = .black
        
        let cartButtonITem = UIBarButtonItem(image: ImageResources.cart, style: .plain, target: self, action: #selector(touchOnNextButton))
        self.navigationItem.rightBarButtonItem = cartButtonITem
        
        navigationController?.navigationBar.shadowImage = UIImage()
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
    }
    
    private func setupFilterTypeView() {
        filterTypeView.delegate = self
    }
    
    // MARK: - Layout
    
    func layoutFilterTypeView() {
        view.addSubview(filterTypeView)
        filterTypeView.snp.makeConstraints { (make) in
            if #available(iOS 11, *) {
                make.top.equalTo(view.safeAreaLayoutGuide)
            } else {
                make.top.equalTo(topLayoutGuide.snp.bottom)
            }
            make.right.equalToSuperview()
            make.height.equalTo(30)
            make.width.equalTo(290)
            
        }
    }
    
    func layoutCollectionView() {
        view.addSubview(collectionView)
        collectionView.snp.makeConstraints { (make) in
            make.top.equalTo(filterTypeView.snp.bottom).offset(12)
            make.right.left.bottom.equalToSuperview()
        }
    }
    
    
}
// MARK: - UICollectionViewDelegate

extension ProductListedViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let productDetailVC = ProductDetailViewController()
        navigationController?.pushViewController(productDetailVC, animated: true)
    }
}

// MARK: - UICollectionViewDataSource

extension ProductListedViewController: UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return viewModel.numberOfSection
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.numberOfRow(in: section)
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ProductItemCollectionViewCell.productItemCellId, for: indexPath) as?
            ProductItemCollectionViewCell else {
                return UICollectionViewCell()
        }
        
        return cell
    }
}

// MARK: - UICollectionViewDelegateFlowLayout

extension ProductListedViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return viewModel.sizeForItem(at: indexPath)
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return viewModel.spacingForItem(at: section)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return viewModel.spacingForSection(at: section)
    }
}

// MARK: - ProductListViewModelDelegate

extension ProductListedViewController: ProductListViewModelDelegate {
    func reloadData() {
        collectionView.reloadData()
    }
}

// MARK: - FilterTypeViewDelegate

extension ProductListedViewController: FilterTypeViewDelegate {
    func didSelectFilter(with filterType: FilterType) {
        
    }
}
