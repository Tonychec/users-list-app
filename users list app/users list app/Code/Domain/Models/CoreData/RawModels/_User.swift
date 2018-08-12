// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to User.swift instead.

import Foundation
import CoreData

public enum UserAttributes: String {
    case email = "email"
    case phone = "phone"
}

public enum UserRelationships: String {
    case name = "name"
    case picture = "picture"
}

open class _User: NSManagedObject {

    // MARK: - Class methods

    open class func entityName () -> String {
        return "User"
    }

    open class func entity(managedObjectContext: NSManagedObjectContext) -> NSEntityDescription? {
        return NSEntityDescription.entity(forEntityName: self.entityName(), in: managedObjectContext)
    }

    // MARK: - Life cycle methods

    public override init(entity: NSEntityDescription, insertInto context: NSManagedObjectContext?) {
        super.init(entity: entity, insertInto: context)
    }

    public convenience init?(managedObjectContext: NSManagedObjectContext) {
        guard let entity = _User.entity(managedObjectContext: managedObjectContext) else { return nil }
        self.init(entity: entity, insertInto: managedObjectContext)
    }

    // MARK: - Properties

    @NSManaged open
    var email: String?

    @NSManaged open
    var phone: String?

    // MARK: - Relationships

    @NSManaged open
    var name: Name

    @NSManaged open
    var picture: Picture?

}

