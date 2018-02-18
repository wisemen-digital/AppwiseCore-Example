// Generated using SwiftGen, by O.Halligon — https://github.com/SwiftGen/SwiftGen

import Foundation

// swiftlint:disable superfluous_disable_command
// swiftlint:disable file_length

// swiftlint:disable explicit_type_interface identifier_name line_length nesting type_body_length type_name
enum L10n {

  enum Common {

    enum Button {
      /// Cancel
      static let cancel = L10n.tr("Localizable", "common.button.cancel")
      /// No
      static let no = L10n.tr("Localizable", "common.button.no")
      /// OK
      static let ok = L10n.tr("Localizable", "common.button.ok")
      /// Save
      static let save = L10n.tr("Localizable", "common.button.save")
      /// Yes
      static let yes = L10n.tr("Localizable", "common.button.yes")
    }

    enum Message {
      /// Error: %@
      static func error(_ p1: String) -> String {
        return L10n.tr("Localizable", "common.message.error", p1)
      }
      /// Loading...
      static let loading = L10n.tr("Localizable", "common.message.loading")
      /// Tap to refresh...
      static let tapToRefresh = L10n.tr("Localizable", "common.message.tap-to-refresh")
    }
  }

  enum Example {

    enum Stuff {
      /// %ld items
      static func items(_ p1: Int) -> String {
        return L10n.tr("Localizable", "example.stuff.items", p1)
      }
    }
  }

  enum Login {

    enum Button {
      /// Sign-in
      static let signIn = L10n.tr("Localizable", "login.button.sign-in")
    }

    enum Message {
      /// Logging in...
      static let loggingIn = L10n.tr("Localizable", "login.message.logging-in")
    }
  }
}
// swiftlint:enable explicit_type_interface identifier_name line_length nesting type_body_length type_name

extension L10n {
  private static func tr(_ table: String, _ key: String, _ args: CVarArg...) -> String {
    let format = NSLocalizedString(key, tableName: table, bundle: Bundle(for: BundleToken.self), comment: "")
    return String(format: format, locale: Locale.current, arguments: args)
  }
}

private final class BundleToken {}
