//
//  ViewController.swift
//  WeaAreApp
//
//  Created by admin on 7/10/19.
//  Copyright © 2019 admin. All rights reserved.
//

import UIKit

class MainTabBarController: UITabBarController {
    
    // MARK: - View LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTabBar()
    }
    
    
    //MARK: - SetupTabBar
    
    func setupTabBar() {
        tabBar.barTintColor = UIColor.white
        tabBar.tintColor = UIColor.black
        let fontAttributes = [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 17.0)]
        UITabBarItem.appearance().setTitleTextAttributes(fontAttributes, for: .normal)
        
        let homeController = generateNavigationController(
            vc: HomeViewController(),title: "Trang chủ")
        let productController = generateNavigationController(
            vc: ProductCollectionViewController(),title: "Bộ sưu tập")
        let accountController = generateNavigationController(
            vc: AccountNotLoginedViewController(),title: "Tài khoản")
        
        viewControllers = [homeController,productController, accountController]
        
        guard let items = tabBar.items else { return }
        for item in items {
            item.titlePositionAdjustment = UIOffset(horizontal: 0, vertical: -16)
        }
    }
    
    fileprivate func generateNavigationController(vc: UIViewController, title: String) -> UINavigationController{
        vc.navigationItem.title = title
        let navigationController = UINavigationController(rootViewController: vc)
        navigationController.title = title
        return navigationController
    }
    
    
}

