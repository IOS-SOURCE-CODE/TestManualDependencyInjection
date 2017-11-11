//
//  UserTableViewController.swift
//  TestDependencyInjectionManual
//
//  Created by Hiem Seyha on 11/11/17.
//  Copyright © 2017 Hiem Seyha. All rights reserved.
//

import UIKit

class UserTableView: UITableView {

    private var presenter: ContactsListPresenter!

    func configure(with presenter: ContactsListPresenter) {
        self.presenter = presenter
        self.register(UserTableViewCell.self, forCellReuseIdentifier: UserTableViewCell.cellId)
    }
    
}


extension UserTableView: UITableViewDataSource {

   
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (presenter.users?.count)!
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50.0
    }

    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cellPresenter = UserCellPresenter(user: presenter.users![indexPath.row])
        let cell = UserTableViewCell.dequeue(from: tableView, for: indexPath, with: cellPresenter)

        return cell
    }
}

