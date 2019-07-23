//
//  ProductDetailViewModel.swift
//  WeaAreApp
//
//  Created by admin on 7/15/19.
//  Copyright © 2019 admin. All rights reserved.
//

import UIKit

class ProductDetailViewModel {
    var collectionViewHeight: CGFloat {
        let screenBounds = UIScreen.main.bounds
        let currentDeviceRation = (screenBounds.height / screenBounds.width) / Dimension.shared.screenRatio
        let defaultRatioForIP6s: CGFloat = 1.3
        return screenBounds.width * defaultRatioForIP6s * currentDeviceRation
    }
    
}
