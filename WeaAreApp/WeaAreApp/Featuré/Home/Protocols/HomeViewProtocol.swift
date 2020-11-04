//
//  HomeViewProtocol.swift
//  WeaAreApp
//
//  Created by Dang Trung Hieu on 11/4/20.
//  Copyright © 2020 admin. All rights reserved.
//

import Foundation


protocol HomeViewProtocol:class {
    
    func itemSelected(at: IndexPath)
    func numberOfItemsInSection()->Int
    func numberOfSections()->Int
}
