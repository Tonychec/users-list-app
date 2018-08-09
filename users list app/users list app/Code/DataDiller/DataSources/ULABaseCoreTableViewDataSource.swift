//
//  ULABaseCoreTableViewDataSource.swift
//  users list app
//
//  Created by iosNomad on 8/9/18.
//  Copyright © 2018 iosNomad. All rights reserved.
//

import Foundation
import SMDataDiller

class ULABaseCoreTableViewDataSource: SMBaseTableViewDataSource {
    
    override func reload() {
        reload(nil)
    }
    
    func reload(_ completion: (() -> Void)? = nil) {
        guard let dataProvider = self.dataProvider as? ULABaseCoreDataProvider else {
            super.reload()
            return
        }
        
        dataProvider.reload {[weak self] in
            self?.tableView.reloadData()
            completion?()
        }
    }
}
