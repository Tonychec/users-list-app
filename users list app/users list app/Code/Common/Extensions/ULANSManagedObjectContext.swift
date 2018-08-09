//
//  ULANSManagedObjectContext.swift
//  users list app
//
//  Created by iosNomad on 8/9/18.
//  Copyright © 2018 iosNomad. All rights reserved.
//


import Foundation
import CoreData

extension NSManagedObjectContext {
    
    func blockAndSave() {
        performAndWait { [weak self] in
            do {
                try self?.save()
            } catch {
                print(error)
            }
        }
        
        if let parent = self.parent {
            parent.blockAndSave()
        }
    }
    
    func save(withCompletion completion: (() -> Void)? = nil) {
        perform { [weak self] in
            do {
                try self?.save()
            } catch {
                print(error)
            }
            
            if let parent = self?.parent {
                parent.save(withCompletion: completion)
                
            } else {
                DispatchQueue.main.async {
                    completion?()
                }
            }
        }
    }
    
    func deleteAllObjects(ofEntityName entityName: String) {
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: entityName)
        request.includesSubentities = false
        
        let deleteRequest = NSBatchDeleteRequest(fetchRequest: request)
        do {
            try execute(deleteRequest)
        } catch {}
        
        blockAndSave()
    }
}
