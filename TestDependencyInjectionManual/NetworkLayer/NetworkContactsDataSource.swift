//
//  NetworkContactsDataSource.swift
//  TestDependencyInjectionManual
//
//  Created by Hiem Seyha on 11/11/17.
//  Copyright © 2017 Hiem Seyha. All rights reserved.
//

import Foundation
protocol ContactsDataSource {
    func getAll() -> [User]
}

class NetworkContactsDataSource: ContactsDataSource {
    
    func getAll() -> [User] {
        var users: [User] = [User]()
        
        for i in 0..<20 {
            users.append(User(name: "Response Data \(i)"))
        }
        
        return users
    }
}
