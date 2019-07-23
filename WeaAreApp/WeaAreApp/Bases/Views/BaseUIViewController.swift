//
//  BaseUIViewController.swift
//  WeaAreApp
//
//  Created by admin on 7/13/19.
//  Copyright © 2019 admin. All rights reserved.
//

import UIKit

open class BaseUIViewController: UIViewController {
    
    // MARK: LifeCycle
    
    open override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setupTabbar()
    }
    
    open override func viewDidLoad() {
        super.viewDidLoad()
        addBackButtonIfNeeded()
        setupDefaultNavigationBar()
    }
    
    
    // MARK: - UI Action
    
    @objc func touchOnBackButton() {
        navigationController?.popViewController(animated: true)
    }
    
    // MARK: - Public Method
    
    func addBarItems(with itemModels: [BarButtonItemModel], type: BarButtonItemType = .right) {
        
        var barButtonItems: [UIBarButtonItem] = []
        itemModels.forEach {
            barButtonItems.append(buildBarButton(from: $0))
        }
        if type == .right {
            navigationItem.rightBarButtonItems = barButtonItems
        }
        else {
            navigationItem.leftBarButtonItems = barButtonItems
        }
        
    }
    
    // MARK: - SetupView
    
    private func setupDefaultNavigationBar() {
        navigationController?.navigationBar.shadowImage = UIImage()
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
    }
    
    private func setupTabbar() {
        if navigationController?.viewControllers.count ?? 0 > 1 {
            tabBarController?.tabBar.isHidden = true
        }
        else {
            tabBarController?.tabBar.isHidden = false
        }
    }
    
    private func addBackButtonIfNeeded() {
        let numberOfVC = navigationController?.viewControllers.count ?? 0
        guard numberOfVC > 1 else {
            return
        }
        let target: Target = (target: self, #selector(touchOnBackButton))
        let barButtonItemModel = BarButtonItemModel(ImageResources.back, target)
        navigationItem.leftBarButtonItem = buildBarButton(from: barButtonItemModel)
        
    }
    
    private func buildBarButton(from itemModel: BarButtonItemModel) -> UIBarButtonItem {
        let target = itemModel.target
        let customButton = UIButton(type: .custom)
        customButton.frame = CGRect(x: 0, y: 0, width: 30, height: 30)
        customButton.setImage(itemModel.image, for: .normal)
        customButton.addTarget(target, action: target.selector, for: .touchUpInside)
        return UIBarButtonItem(customView: customButton)
    }
    
}
