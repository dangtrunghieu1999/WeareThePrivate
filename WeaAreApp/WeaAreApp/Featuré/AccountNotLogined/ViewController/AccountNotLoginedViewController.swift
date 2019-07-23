//
//  AccountNotLoginedViewController.swift
//  WeaAreApp
//
//  Created by admin on 7/17/19.
//  Copyright © 2019 admin. All rights reserved.
//

import UIKit

class AccountNotLoginedViewController: UIViewController {
    
    // MARK: - Properties
    
    private let viewModel = AccountNotLoginedViewModel()
    
    // MARK: - UI Elements
    
    private lazy var tableView: UITableView = {
        let tableView =  UITableView()
        tableView.dataSource = self
        tableView.delegate = self
        tableView.separatorStyle = .none
        tableView.register(TextTableViewCell.self, forCellReuseIdentifier: TextTableViewCell.textCellId)
        return tableView
    }()
    
    // MARK: - View LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        layoutTableView()
    }
    
    // MARK: - Layout
    
    func layoutTableView() {
        view.addSubview(tableView)
        tableView.snp.makeConstraints { (make) in
            make.height.equalTo(270)
            make.bottom.left.equalToSuperview()
            make.right.equalToSuperview().offset(-30)
        }
    }
    
}
// MARK: - UITableViewDelegate
extension AccountNotLoginedViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return viewModel.heightForItem(at: indexPath)
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let accountLoginVC = AccountLoginViewController()
        navigationController?.pushViewController(accountLoginVC, animated: true)
    }

    
}

// MARK: - UITableViewDataSource

extension AccountNotLoginedViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfItems
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: TextTableViewCell.textCellId, for: indexPath) as? TextTableViewCell else {
            return UITableViewCell()
        }
        let loginItem = viewModel.itemType(at: indexPath)
        cell.configCell(with: loginItem)
        cell.selectionStyle = .none
        return cell
    }
    
    
}
