//
//  ProductListViewModel.swift
//  WeareThePrivate
//
//  Created by Nguyen Dinh Trieu on 3/18/19.
//  Copyright © 2019 MACOS. All rights reserved.
//

import UIKit

protocol ProductListViewModelDelegate: class {
    func reloadData()
}

class ProductListViewModel {
    weak var delegate: ProductListViewModelDelegate?
    private var productItemCellViewModels: [ProductItemCellViewModel] = []
    
    var numberOfSection: Int {
        return 1
    }
    
    init() {
        initDummyData()
        delegate?.reloadData()
    }
    
    func viewDidLoad() {
    }
    
    func numberOfRow(in section: Int) -> Int {
        return productItemCellViewModels.count
    }
    
    func sizeForItem(at indexPath: IndexPath) -> CGSize {
        return productItemCellViewModels[safe: indexPath.row]?.size ?? .zero
    }
    
    func spacingForItem(at  section: Int) -> CGFloat {
        return productItemCellViewModels[safe: section]?.minimumItemSpacing ?? 0
    }
    
    func spacingForSection(at section: Int) -> CGFloat {
        return 0
    }
    
}

extension ProductListViewModel {
    func initDummyData() {
        for i in 0..<10 {
            if i == 9 {
                productItemCellViewModels.append(ProductItemCellViewModel(with: ProductListModel(.large)))
            } else if i == 8 {
                productItemCellViewModels.append(ProductItemCellViewModel(with: ProductListModel(.medium)))
            } else {
                productItemCellViewModels.append(ProductItemCellViewModel(with: ProductListModel(.normal)))
            }
        }
    }
}
