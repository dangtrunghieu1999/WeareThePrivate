//
//  AccountNotLoginedViewModel.swift
//  WeaAreApp
//
//  Created by admin on 7/17/19.
//  Copyright © 2019 admin. All rights reserved.
//

import UIKit

class AccountNotLoginedViewModel {
    private var items: [AccountNotLoginedItemType] = [.accountName, .buy, .myInfo, .help, .contact, .setting]
    
    var numberOfItems: Int {
        return items.count
    }
    
    func heightForItem(at indexPath: IndexPath) -> CGFloat {
        guard let type = itemType(at: indexPath) else {
            return 0
        }
        switch type {
        case .accountName:
            return 40
        default:
            return 35
        }
    }
    
    func itemType(at indexPath: IndexPath) -> AccountNotLoginedItemType? {
        return items[safe: indexPath.item]
    }
    
    func itemAttribute(at indexPath: IndexPath) -> (String, UIFont)? {
        guard let type = itemType(at: indexPath) else {
            return nil
        }
        switch type {
        case .accountName:
            return (type.rawValue, Dimension.shared.bodyBoldFont)
        default:
            return (type.rawValue, Dimension.shared.bodyFont)
        }
    }
    
}
