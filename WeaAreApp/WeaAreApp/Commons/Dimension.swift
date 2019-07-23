//
//  Dimension.swift
//  WeaAreApp
//
//  Created by admin on 7/15/19.
//  Copyright © 2019 admin. All rights reserved.
//

import UIKit

public final class Dimension {
    public static var shared = Dimension()
    
    private init() {
    }
    
    var screenRatio: CGFloat {
        let ip6sHeight: CGFloat = 667
        let ip6sWidth: CGFloat = 375
        return ip6sHeight / ip6sWidth
    }
    
    var smallBodyFont: UIFont {
        return UIFont.systemFont(ofSize: 16)
    }
    
    var smallBodyBoldFont: UIFont {
        return UIFont.systemFont(ofSize: 16, weight: .bold)
    }
    
    var bodyFont: UIFont {
        return UIFont.systemFont(ofSize: 16)
    }
    
    var bodyBoldFont: UIFont {
        return UIFont.systemFont(ofSize: 16, weight: .bold)
    }
    
}
