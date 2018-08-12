// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to Picture.swift instead.

import Foundation
import CoreData

public enum PictureAttributes: String {
    case large = "large"
    case medium = "medium"
    case thumbnail = "thumbnail"
}

public enum PictureRelationships: String {
    case user = "user"
}

open class _Picture: NSManagedObject {

    // MARK: - Class methods

    open class func entityName () -> String {
        return "Picture"
    }

    open class func entity(managedObjectContext: NSManagedObjectContext) -> NSEntityDescription? {
        return NSEntityDescription.entity(forEntityName: self.entityName(), in: managedObjectContext)
    }

    // MARK: - Life cycle methods

    public override init(entity: NSEntityDescription, insertInto context: NSManagedObjectContext?) {
        super.init(entity: entity, insertInto: context)
    }

    public convenience init?(managedObjectContext: NSManagedObjectContext) {
        guard let entity = _Picture.entity(managedObjectContext: managedObjectContext) else { return nil }
        self.init(entity: entity, insertInto: managedObjectContext)
    }

    // MARK: - Properties

    @NSManaged open
    var large: String?

    @NSManaged open
    var medium: String?

    @NSManaged open
    var thumbnail: String?

    // MARK: - Relationships

    @NSManaged open
    var user: User

}

