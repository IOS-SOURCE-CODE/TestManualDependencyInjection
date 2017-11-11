//
//  UserTableViewCell.swift
//  TestDependencyInjectionManual
//
//  Created by Hiem Seyha on 11/11/17.
//  Copyright © 2017 Hiem Seyha. All rights reserved.
//

import UIKit
import SnapKit

class UserTableViewCell: UITableViewCell {
    
    fileprivate var presenter: UserCellPresenter!
    lazy var usernameLabel = UILabel()
    
    override func layoutSubviews() {
        super.layoutSubviews()
       
    }
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: UserTableViewCell.cellId)
        
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}


//MARK: - Configure
extension UserTableViewCell {
    func configure(with presenter: UserCellPresenter) {
        
        self.presenter = presenter
        usernameLabel.text = presenter.name
    }
}

//MARK: - Setup View
extension UserTableViewCell {
    
    private func commonInit() {
        
       contentView.addSubview(usernameLabel)
        
        usernameLabel.snp.makeConstraints { (make) in
            make.edges.equalTo(self).inset(UIEdgeInsets(top: 2, left: 15, bottom: 2, right: 5))
        }
    }
}


//MARK: - Helper Method
extension UserTableViewCell {

    public static var cellId: String {
        return "UserCell"
    }
    
    public static var bundle:Bundle {
        return Bundle(for: UserTableViewCell.self)
    }
    
    public static var nib: UINib {
        return UINib(nibName: cellId, bundle: bundle)
    }
    
    public static func register(with tableView: UITableView) {
        tableView.register(nib, forCellReuseIdentifier: cellId)
    }
    
    public static func dequeue(from tableView: UITableView, for indexPath: IndexPath, with presenter: UserCellPresenter) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as! UserTableViewCell
        cell.configure(with: presenter)
        return cell
    }
}








