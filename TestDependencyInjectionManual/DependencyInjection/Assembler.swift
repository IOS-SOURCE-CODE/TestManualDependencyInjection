//
//  Assembler.swift
//  TestDependencyInjectionManual
//
//  Created by Hiem Seyha on 11/11/17.
//  Copyright © 2017 Hiem Seyha. All rights reserved.
//

import Foundation

class Assembler: ContactsSceneAssembler { }

protocol ContactsSceneAssembler {
    
    func resolve() -> UsersListViewController
    
    func resolve() -> ContactsListPresenter
    
    func resolve() -> GetAllContacts
    
    func resolve() -> ContactsDataSource
    
}


extension ContactsSceneAssembler {
    
    func resolve() -> UsersListViewController {
        return UsersListViewController(presenter: resolve())
    }
    
    func resolve() -> ContactsListPresenter {
        return ContactsListPresenter(getAllContacts: resolve())
    }
    
    func resolve() -> GetAllContacts {
        return GetAllContacts(contactsDataSource: resolve())
    }
    
    func resolve() -> ContactsDataSource {
        return NetworkContactsDataSource()
    }
    
   
}
