// swiftlint:disable all
// Generated using SwiftGen — https://github.com/SwiftGen/SwiftGen

// swiftlint:disable superfluous_disable_command
// swiftlint:disable sorted_imports
import CoreData
import Foundation

// swiftlint:disable attributes file_length vertical_whitespace_closing_braces
// swiftlint:disable identifier_name line_length type_body_length

// MARK: - User

internal class User: NSManagedObject {
  internal class var entityName: String {
    return "User"
  }

  internal class func entity(in managedObjectContext: NSManagedObjectContext) -> NSEntityDescription? {
    return NSEntityDescription.entity(forEntityName: entityName, in: managedObjectContext)
  }

  @nonobjc internal class func fetchRequest() -> NSFetchRequest<User> {
    return NSFetchRequest<User>(entityName: entityName)
  }

  // swiftlint:disable discouraged_optional_boolean discouraged_optional_collection
  internal dynamic var id: User.ID {
    get {
      let key = "id"
      willAccessValue(forKey: key)
      defer { didAccessValue(forKey: key) }

      guard let value = primitiveValue(forKey: key) as? User.ID.RawValue,
        let result = User.ID(rawValue: value) else {
        fatalError("Could not convert value for key '\(key)' to type 'User.ID'")
      }
      return result
    }
    set {
      let key = "id"
      willChangeValue(forKey: key)
      defer { didChangeValue(forKey: key) }

      setPrimitiveValue(newValue.rawValue, forKey: key)
    }
  }
  // swiftlint:enable discouraged_optional_boolean discouraged_optional_collection
}

// swiftlint:enable identifier_name line_length type_body_length
