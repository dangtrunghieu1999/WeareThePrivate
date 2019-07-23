//
//  FilterTypeView.swift
//  WeaAreApp
//
//  Created by admin on 7/12/19.
//  Copyright © 2019 admin. All rights reserved.
//

import UIKit

protocol FilterTypeViewDelegate: class {
    func didSelectFilter(with filterType: FilterType)
}

class FilterTypeView: UIView {
    
    // MAKR: - Properties
    
    private var filterTypeViewModel = FiltertTypeViewModel()

    weak var delegate: FilterTypeViewDelegate?
    
     // MARK: - UI Elments
    
    private lazy var collectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: .zero,
                                              collectionViewLayout: UICollectionViewFlowLayout())
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.backgroundColor = .white
        collectionView.register(FilterTypeCollectionViewCell.self,
                                forCellWithReuseIdentifier: FilterTypeCollectionViewCell.filterId)
        return collectionView
    }()
    
    // MARK: - View LifeCycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        layoutCollectionView()
    }
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        layoutCollectionView()
        
    }
    // MARK: - Layout
    func layoutCollectionView() {
        addSubview(collectionView)
        collectionView.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
    }
}

// MARK: - UICollectionViewDelegate
extension FilterTypeView: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let filterType = filterTypeViewModel.getFilterType(at: indexPath) else {
            return
        }
        delegate?.didSelectFilter(with: filterType)
    }
}
// MARK: - UICollectionViewDataSource
extension FilterTypeView: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return filterTypeViewModel.numberItem
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: FilterTypeCollectionViewCell.filterId, for: indexPath) as? FilterTypeCollectionViewCell else {
            return UICollectionViewCell()
        }
        let filterType = filterTypeViewModel.getFilterType(at: indexPath)
        cell.configCell(with: filterType)
        return cell
    }
}
// MARK: - UICollectionViewDelegateFlowLayout
extension FilterTypeView: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = filterTypeViewModel.widthForItem(at: indexPath)
        return CGSize(width: width, height: collectionView.frame.height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
}

