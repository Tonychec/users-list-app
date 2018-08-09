//
//  ULARootTransaction.swift
//  users list app
//
//  Created by iosNomad on 8/9/18.
//  Copyright © 2018 iosNomad. All rights reserved.
//


import UIKit

class ULARootTransaction {
    
    var selectedTabIndex = 0
    
    func execute() {
        execute(withObject: UIApplication.shared.keyWindow!)
    }
    
    func execute(withObject object: UIWindow) {
        let rootController = rootViewController()
        object.rootViewController = rootController
    }
    
    private func rootViewController() -> UITabBarController {
        
        let users = UINavigationController(rootViewController: ULAUsersViewController())
        users.tabBarItem = UITabBarItem(title: ULAStrings.Tabs.users.rawValue, image: #imageLiteral(resourceName: "tab_users"), selectedImage: #imageLiteral(resourceName: "tab_users_active"))
        
        let saved = UINavigationController(rootViewController: ULASavedViewController())
        saved.tabBarItem = UITabBarItem(title: ULAStrings.Tabs.saved.rawValue, image: #imageLiteral(resourceName: "tab_saved"), selectedImage: #imageLiteral(resourceName: "tab_saved_active"))
        
        let tabBar = UITabBarController()
        tabBar.viewControllers = [users, saved]
        tabBar.selectedViewController = tabBar.viewControllers?[selectedTabIndex]
        
        return tabBar
    }
}
