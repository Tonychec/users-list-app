//
//  ULASavedViewController.swift
//  users list app
//
//  Created by iosNomad on 8/9/18.
//  Copyright © 2018 iosNomad. All rights reserved.
//

import UIKit
import SMDataDiller

class ULASavedViewController: ULAUsersViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.title = ULAStrings.Tabs.saved.rawValue
    }
    
    override func setupPaginator() { }
    
    override func iDataProvider() -> SMBaseDataProvider {
        let dataProvider = ULAUsersDataProvider()
        dataProvider.predicate = NSPredicate(format: "\(ULAUserAttributes.isSaved) == true")
        return dataProvider
    }
}
