// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to ULAUser.swift instead.

import Foundation
import CoreData

public enum ULAUserAttributes: String {
    case email = "email"
    case isSaved = "isSaved"
    case phone = "phone"
}

public enum ULAUserRelationships: String {
    case name = "name"
    case picture = "picture"
}

open class _ULAUser: NSManagedObject {

    // MARK: - Class methods

    open class func entityName () -> String {
        return "ULAUser"
    }

    open class func entity(managedObjectContext: NSManagedObjectContext) -> NSEntityDescription? {
        return NSEntityDescription.entity(forEntityName: self.entityName(), in: managedObjectContext)
    }

    // MARK: - Life cycle methods

    public override init(entity: NSEntityDescription, insertInto context: NSManagedObjectContext?) {
        super.init(entity: entity, insertInto: context)
    }

    public convenience init?(managedObjectContext: NSManagedObjectContext) {
        guard let entity = _ULAUser.entity(managedObjectContext: managedObjectContext) else { return nil }
        self.init(entity: entity, insertInto: managedObjectContext)
    }

    // MARK: - Properties

    @NSManaged open
    var email: String

    @NSManaged open
    var isSaved: NSNumber?

    @NSManaged open
    var phone: String?

    // MARK: - Relationships

    @NSManaged open
    var name: ULAName

    @NSManaged open
    var picture: ULAPicture?

}

