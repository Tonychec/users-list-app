//
//  ULASavedViewController.swift
//  users list app
//
//  Created by iosNomad on 8/9/18.
//  Copyright © 2018 iosNomad. All rights reserved.
//

import UIKit

class ULASavedViewController: ULAUsersViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.title = ULAStrings.Tabs.saved.rawValue
    }
}
