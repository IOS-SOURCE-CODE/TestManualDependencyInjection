//
//  AppDelegate.swift
//  TestDependencyInjectionManual
//
//  Created by Hiem Seyha on 11/11/17.
//  Copyright © 2017 Hiem Seyha. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {

        setupViewController()
        
        return true
    }


}

//MAKR: - Setup First View Controller
extension AppDelegate {
    
    func setupViewController() {
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.makeKeyAndVisible()
        window?.backgroundColor = UIColor.white
        
        let assembler = Assembler()
        
        let vc = UsersListViewController(presenter: assembler.resolve())
        
        let nv = UINavigationController(rootViewController: vc)
        nv.navigationBar.topItem?.title = "Hello Profession Code".uppercased()
        
        window?.rootViewController = nv
    }
}

