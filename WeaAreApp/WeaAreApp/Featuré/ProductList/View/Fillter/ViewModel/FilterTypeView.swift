//
//  FilterTypeView.swift
//  WeareThePrivate
//
//  Created by MACOS on 3/18/19.
//  Copyright © 2019 MACOS. All rights reserved.
//

import UIKit

protocol FilterTypeViewDelegate: class {
    func didSelectFilter(with filterType: FilterType)
}

class FilterTypeView: BaseXibView {
    @IBOutlet private var containerView: FilterTypeView?
    @IBOutlet private weak var collectionView: UICollectionView?
    
    weak var delegate: FilterTypeViewDelegate?
    private var filterTypeViewModel = FiltertTypeViewModel()
    
    override func initialize() {
        Bundle.main.loadNibNamed("FilterTypeView", owner: self, options: [:])
        commonInit(view: containerView)
        setupViewCollectionView()
    }
    
    private func setupViewCollectionView() {
        collectionView?.delegate = self
        collectionView?.dataSource = self
        collectionView?.isScrollEnabled = false
        collectionView?.registerReusableCell(FilterTypeCollectionViewCell.self)
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
        let cell: FilterTypeCollectionViewCell = collectionView.dequeueReusableCell(for: indexPath)
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
