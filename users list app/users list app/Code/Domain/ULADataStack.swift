//
//  ULADataStack.swift
//  users list app
//
//  Created by iosNomad on 8/12/18.
//  Copyright © 2018 iosNomad. All rights reserved.
//


import Foundation
import CoreData
import Sync


class ULADataStack {
    
    static let shared = ULADataStack()
    static var stack = DataStack(modelName: "users_list_app")
}

extension DataStack {
    
    func performFetchRequestInBackgroundAndMigrateToMain<ObjectsType: NSManagedObject>(request: NSFetchRequest<NSFetchRequestResult>, completion: @escaping (_ objects: [ObjectsType]) -> Void) {
    
        performFetchRequestInBackground(request: request, andMigrateToContext: mainContext, completion: completion)
    }
    
    func performFetchRequestInBackground<ObjectsType: NSManagedObject>(request: NSFetchRequest<NSFetchRequestResult>, andMigrateToContext context: NSManagedObjectContext, completion: @escaping (_ objects: [ObjectsType]) -> Void) {
        
        self.performBackgroundTask { (backgroundContext) in
            
            var backgroundItems = [ObjectsType]()
            do {
                backgroundItems = try backgroundContext.fetch(request) as! [ObjectsType]
            } catch {
                completion(backgroundItems)
                return
            }
            
            context.perform {
                var items = [ObjectsType]()
                for item in backgroundItems {
                    items.append(context.object(with: item.objectID) as! ObjectsType)
                }
                
                completion(items)
            }
        }
    }
}
