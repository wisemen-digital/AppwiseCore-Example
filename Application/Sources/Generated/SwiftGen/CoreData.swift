// swiftlint:disable all
// Generated using SwiftGen — https://github.com/SwiftGen/SwiftGen

import CoreData
import Foundation

// swiftlint:disable superfluous_disable_command
// swiftlint:disable attributes file_length vertical_whitespace_closing_braces
// swiftlint:disable identifier_name line_length type_body_length

// MARK: - User

internal class User: NSManagedObject {
  internal class func entityName() -> String {
    return "User"
  }

  internal class func entity(in managedObjectContext: NSManagedObjectContext) -> NSEntityDescription? {
    return NSEntityDescription.entity(forEntityName: entityName(), in: managedObjectContext)
  }

  @nonobjc internal class func fetchRequest() -> NSFetchRequest<User> {
    return NSFetchRequest<User>(entityName: entityName())
  }

  // swiftlint:disable discouraged_optional_boolean discouraged_optional_collection
  @NSManaged internal var id: Int64
  // swiftlint:enable discouraged_optional_boolean discouraged_optional_collection
}

// swiftlint:enable identifier_name line_length type_body_length
