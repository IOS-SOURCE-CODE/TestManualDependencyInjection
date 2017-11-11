//
//  UserCellPresenter.swift
//  TestDependencyInjectionManual
//
//  Created by Hiem Seyha on 11/11/17.
//  Copyright © 2017 Hiem Seyha. All rights reserved.
//

import Foundation
class UserCellPresenter {
    
    let user: User
    
    var name: String { return user.name }
    
    init(user: User) {
        self.user = user
    }
}
