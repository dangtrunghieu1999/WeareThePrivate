//
//  FilterTypeViewModel.swift
//  WeaAreApp
//
//  Created by admin on 7/12/19.
//  Copyright © 2019 admin. All rights reserved.
//

import UIKit

enum FilterType: String {
    case all        = "ALL"
    case new        = "NEW"
    case bestSeller = "BEST SELLER"
    case filter     = "+FILTER"
}

class FiltertTypeViewModel {
    private var filterTypes: [FilterType] = []
    
    init() {
        filterTypes.append(.all)
        filterTypes.append(.new)
        filterTypes.append(.bestSeller)
        filterTypes.append(.filter)
    }
    
    var numberItem: Int {
        return filterTypes.count
    }
    
    func getFilterType(at indexPath: IndexPath) -> FilterType? {
        return filterTypes[safe: indexPath.row]
    }
    
    func widthForItem(at indexPath: IndexPath) -> CGFloat {
        guard let type = filterTypes[safe: indexPath.row] else {
            return 0
        }
        switch type {
        case .all, .new:
            return 60
        case .bestSeller:
            return 100
        case .filter:
            return 70
        }
    }
    
}
