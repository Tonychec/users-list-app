// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to ULAName.swift instead.

import Foundation
import CoreData

public enum ULANameAttributes: String {
    case first = "first"
    case last = "last"
    case title = "title"
}

public enum ULANameRelationships: String {
    case user = "user"
}

open class _ULAName: NSManagedObject {

    // MARK: - Class methods

    open class func entityName () -> String {
        return "ULAName"
    }

    open class func entity(managedObjectContext: NSManagedObjectContext) -> NSEntityDescription? {
        return NSEntityDescription.entity(forEntityName: self.entityName(), in: managedObjectContext)
    }

    // MARK: - Life cycle methods

    public override init(entity: NSEntityDescription, insertInto context: NSManagedObjectContext?) {
        super.init(entity: entity, insertInto: context)
    }

    public convenience init?(managedObjectContext: NSManagedObjectContext) {
        guard let entity = _ULAName.entity(managedObjectContext: managedObjectContext) else { return nil }
        self.init(entity: entity, insertInto: managedObjectContext)
    }

    // MARK: - Properties

    @NSManaged open
    var first: String?

    @NSManaged open
    var last: String?

    @NSManaged open
    var title: String?

    // MARK: - Relationships

    @NSManaged open
    var user: ULAUser

}

