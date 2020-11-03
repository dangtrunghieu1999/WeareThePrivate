//
//  UITableView+Extension.swift
//  WeaAreApp
//
//  Created by Dang Trung Hieu on 11/3/20.
//  Copyright © 2020 admin. All rights reserved.
//

import UIKit

public extension UITableView {
    func registerReusableCell<T: UITableViewCell>(_: T.Type) where T:Reusable {
        register(T.self, forCellReuseIdentifier: T.reuseIdentifier)
    }
    
    func registerReusableHeaderFooter<T: UITableViewHeaderFooterView>(_: T.Type) where T: Reusable {
        register(T.self, forHeaderFooterViewReuseIdentifier: T.reuseIdentifier)
    }
    
    func dequeueReusableCell<T: UITableViewCell>(for indexPath: IndexPath) -> T where T:Reusable {
        guard let cell = dequeueReusableCell(withIdentifier: T.reuseIdentifier, for: indexPath) as? T else {
            return T()
        }
        return cell
    }
    
    func dequeueReusableHeaderFooterView<T: UITableViewHeaderFooterView>() -> T where T: Reusable {
        guard let view = dequeueReusableHeaderFooterView(withIdentifier: T.reuseIdentifier) as? T else {
            return T()
        }
        return view
    }
}
