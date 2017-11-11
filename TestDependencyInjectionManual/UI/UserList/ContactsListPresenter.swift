//
//  ContactsListPresenter.swift
//  TestDependencyInjectionManual
//
//  Created by Hiem Seyha on 11/11/17.
//  Copyright © 2017 Hiem Seyha. All rights reserved.
//

import Foundation


protocol ContactsListUI: class {
    func show(users: [User])
}


typealias Block = () -> ()
typealias BlockAndSource = (_ users:[User]) -> ()

class ContactsListPresenter  {
    
    var users: [User]?
    
    private let getAllContacts: GetAllContacts
    
    init(getAllContacts: GetAllContacts) {
        self.getAllContacts = getAllContacts
    }
    
    func getAll(_ finished: @escaping BlockAndSource) {
        self.users = self.getAllContacts.getAll()
        finished(users!)
    }

}
