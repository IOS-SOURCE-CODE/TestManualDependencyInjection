//
//  ViewController.swift
//  TestDependencyInjectionManual
//
//  Created by Hiem Seyha on 11/11/17.
//  Copyright © 2017 Hiem Seyha. All rights reserved.
//

import UIKit
import SnapKit

class UsersListViewController: UIViewController {
    
    lazy var userTableView = UserTableView()
    lazy var usernameLabel = UILabel()
    
    private let presenter: ContactsListPresenter
    
    init(presenter: ContactsListPresenter) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupTableView()
        
        presenter.getAll { [weak self] users in
            
            self?.userTableView.configure(with: (self?.presenter)!)
            self?.userTableView.reloadData()
            
        }
    }
    
    func setupTableView() {
        
        self.view.addSubview(userTableView)
        userTableView.dataSource = self
        userTableView.delegate = self
        
        userTableView.snp.makeConstraints { (make) -> Void in
            if #available(iOS 11, *) {
                make.edges.equalTo(self.view.safeAreaLayoutGuide)
            } else {
                make.edges.equalTo(self.view).inset(UIEdgeInsetsMake(5, 5, 5, 5))
            }
        }
    }
    
    func setupLabel() {
        
        self.view.addSubview(usernameLabel)
        
        usernameLabel.snp.makeConstraints { (make) in
            make.width.equalTo(200)
            make.height.equalTo(100)
            make.center.equalTo(self.view)
        }
        usernameLabel.textAlignment = .center
    }
}

extension UsersListViewController: UITableViewDataSource, UITableViewDelegate {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return userTableView.tableView(tableView,numberOfRowsInSection:section)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        return userTableView.tableView(tableView,cellForRowAt:indexPath)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return userTableView.tableView(tableView,heightForRowAt:indexPath)
    }
    
}




