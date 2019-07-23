//
//  HomeViewModel.swift
//  WeaAreApp
//
//  Created by admin on 7/10/19.
//  Copyright © 2019 admin. All rights reserved.
//

import UIKit

class HomeViewModel {
    var images: [UIImage?] = [UIImage(named: "1"), UIImage(named: "2"), UIImage(named: "3"), UIImage(named: "4"), UIImage(named: "5"), UIImage(named: "6"), UIImage(named: "7"), UIImage(named: "8"), UIImage(named: "9"), UIImage(named: "10")]
    
    var numberItems: Int {
        return images.count
    }
}
