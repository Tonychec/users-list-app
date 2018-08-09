//
//  ULABaseCoreDataProvider.swift
//  users list app
//
//  Created by iosNomad on 8/9/18.
//  Copyright © 2018 iosNomad. All rights reserved.
//

import Foundation
import SMDataDiller

class ULABaseCoreDataProvider: SMBaseDataProvider {
    
    func reload(_ completion: (() -> Void)?) {
        assert(false, "Need to implement in subclass")
    }
    
    override func reload() {
        print(String(describing: self) + ": Use reload(completion)")
    }
}
