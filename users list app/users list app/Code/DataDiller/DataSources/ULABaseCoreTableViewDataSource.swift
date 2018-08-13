//
//  ULABaseCoreTableViewDataSource.swift
//  users list app
//
//  Created by iosNomad on 8/9/18.
//  Copyright © 2018 iosNomad. All rights reserved.
//

import Foundation
import SMDataDiller
import Sync

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
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            if let item = self.dataProvider.item(at: indexPath) as? NSManagedObject {
                ULADataStack.stack.mainContext.delete(item)
                ULADataStack.stack.mainContext.blockAndSave()
                self.dataProvider.items.remove(at: indexPath.row)
                self.tableView.deleteRows(at: [indexPath], with: .right)
            }
        }
    }
}
