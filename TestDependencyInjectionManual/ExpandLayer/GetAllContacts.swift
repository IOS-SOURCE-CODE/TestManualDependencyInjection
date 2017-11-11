//
//  GetAllContacts.swift
//  TestDependencyInjectionManual
//
//  Created by Hiem Seyha on 11/11/17.
//  Copyright © 2017 Hiem Seyha. All rights reserved.
//

import Foundation


class GetAllContacts {
   
    public let contactsDataSource: ContactsDataSource
    
    init(contactsDataSource: ContactsDataSource) {
        self.contactsDataSource = contactsDataSource
    }
    
    func getAll() -> [User]{
        return self.contactsDataSource.getAll()
    }

}

