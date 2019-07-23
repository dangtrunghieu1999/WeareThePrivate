//
//  CartViewController.swift
//  WeaAreApp
//
//  Created by admin on 7/14/19.
//  Copyright © 2019 admin. All rights reserved.
//

import UIKit

class CartViewController: UIViewController {
    
    // MARK: - UI Elements
    
    private var cartLabel: UILabel = {
        let label = UILabel()
        label.text = "Giỏ hàng"
        label.font = .systemFont(ofSize: 20)
        return label
    }()
    
    private var numberCartLabel: UILabel = {
        let label = UILabel()
        label.text = "Có 4 mặt hàng được chọn"
        label.font = .systemFont(ofSize: 11)
        return label
    }()
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(CartTableViewCell.self, forCellReuseIdentifier: CartTableViewCell.cartCellID)
        tableView.separatorStyle = .none
        return tableView
    }()
    
    private var totalPriceLabel: UILabel = {
        let label = UILabel()
        label.text = "2.449.000 VND"
        label.font = .systemFont(ofSize: 20)
        return label
    }()
    
    private var descriptionLabel: UILabel = {
        let label = UILabel()
        label.text = "Chưa có chi phí tiền giao hàng"
        label.font = .systemFont(ofSize: 11)
        return label
    }()
    
    private var buyButton: UIButton = {
        let button = UIButton()
        button.setTitle("MUA NGAY", for: .normal)
        button.backgroundColor = UIColor.black
        button.addTarget(self, action: #selector(buyNowButton), for: .touchUpInside)
        return button
    }()
    
    private var whiteView: UIView = {
      let view = UIView()
        view.backgroundColor = .white
        return view
    }()
    // MARK: - View LifeCycle
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        tabBarController?.tabBar.isHidden = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(true)
        tabBarController?.tabBar.isHidden = false
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupBarButton()
        layoutCartLabel()
        layoutNumberCartLabel()
        layoutTableView()
        layoutWhiteView()
        layoutTotalPriceLabel()
        layoutDescriptionLabel()
        layoutBuyNowButton()
    }
    
    // MARK: - SetupView
    
    @objc private func touchOnBackButton() {
        navigationController?.popViewController(animated: true)
    }
    
    func setupBarButton() {
        let backButtonITem = UIBarButtonItem(image: ImageResources.back, style: .plain, target: self, action: #selector(touchOnBackButton))
        self.navigationItem.leftBarButtonItem = backButtonITem
        navigationController?.navigationBar.tintColor = .black
        navigationController?.navigationBar.shadowImage = UIImage()
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
    }
    
    //MARK: UI Action
    @objc func buyNowButton() {
        navigationController?.pushViewController(HomeViewController(), animated: true)
    }
    
    // MARK: - Layout
    
    func layoutCartLabel() {
        view.addSubview(cartLabel)
        cartLabel.snp.makeConstraints { (make) in
            make.left.equalToSuperview().offset(30)
            if #available(iOS 11, *) {
                make.top.equalTo(view.safeAreaLayoutGuide)
            } else {
                make.top.equalTo(topLayoutGuide.snp.bottom)
            }
        }
    }
    
    func layoutNumberCartLabel() {
        view.addSubview(numberCartLabel)
        numberCartLabel.snp.makeConstraints { (make) in
            make.top.equalTo(cartLabel.snp.bottom).offset(4)
            make.left.equalTo(cartLabel.snp.left)
            
        }
    }
    
    func layoutTableView() {
        view.addSubview(tableView)
        tableView.snp.makeConstraints { (make) in
            make.top.equalTo(numberCartLabel.snp.bottom).offset(16)
            make.left.right.equalToSuperview()
            make.bottom.equalToSuperview().offset(140)
        }
    }
    
    func layoutWhiteView() {
        let heightView = UIScreen.main.bounds.height - 140
        view.addSubview(whiteView)
        whiteView.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(heightView)
            make.right.left.bottom.equalToSuperview()
        }
    }
    
    
    func layoutTotalPriceLabel() {
        whiteView.addSubview(totalPriceLabel)
        totalPriceLabel.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(20)
            make.centerX.equalToSuperview()
        }
    }
    
    func layoutDescriptionLabel(){
        whiteView.addSubview(descriptionLabel)
        descriptionLabel.snp.makeConstraints { (make) in
            make.centerX.equalToSuperview()
            make.top.equalTo(totalPriceLabel.snp.bottom).offset(4)
        }
    }
    
    func layoutBuyNowButton() {
        whiteView.addSubview(buyButton)
        buyButton.snp.makeConstraints { (make) in
            make.height.equalTo(50)
            make.left.equalToSuperview().offset(16)
            make.right.equalToSuperview().offset(-16)
            make.top.equalTo(descriptionLabel.snp.bottom).offset(16)
        }
    }
    
}

extension CartViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 188
    }
    func tableView(_ tableView: UITableView, shouldHighlightRowAt indexPath: IndexPath) -> Bool {
        return false
    }
    
}
extension CartViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CartTableViewCell.cartCellID, for: indexPath) as? CartTableViewCell else {
            return UITableViewCell()
        }
        return cell
    }
    
    
}



