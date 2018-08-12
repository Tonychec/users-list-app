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
    
    let entityName: String
    var orderAttributeName: String
    let context: NSManagedObjectContext
    var ascending = true
    var predicate: NSPredicate?
    var includesSubentities = false
    
    init(withEntityName entityName: String, orderAttributeName: String = ULAUserAttributes.email.rawValue, context: NSManagedObjectContext = ULADataStack.stack.mainContext) {
        self.entityName = entityName
        self.orderAttributeName = orderAttributeName
        self.context = context
        super.init()
    }
    
    func reload(_ completion: (() -> Void)?) {
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: entityName)
        request.sortDescriptors = [NSSortDescriptor(key: orderAttributeName, ascending: ascending)]
        request.predicate = predicate
        request.includesSubentities = includesSubentities
        
        ULADataStack.stack.performFetchRequestInBackground(request: request, andMigrateToContext: context) { [weak self] (items) in
            self?.items = items
            completion?()
        }
    }
}
