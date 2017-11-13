//
//  UsernameLabel.swift
//  TestDependencyInjectionManual
//
//  Created by Hiem Seyha on 11/13/17.
//  Copyright © 2017 Hiem Seyha. All rights reserved.
//

import UIKit
import SnapKit

class UsernameLabel: UILabel {

    override func didMoveToSuperview() {
        setupLabel()
    }

    func setupLabel() {
        
        self.snp.makeConstraints { (make) in
            make.width.equalTo(200)
            make.height.equalTo(100)
            make.center.equalTo(superview!)
        }
        self.textAlignment = .center
    }
}
