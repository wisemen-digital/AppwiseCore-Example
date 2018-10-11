// swiftlint:disable all
// Generated using SwiftGen, by O.Halligon — https://github.com/SwiftGen/SwiftGen

import Foundation

// swiftlint:disable superfluous_disable_command
// swiftlint:disable file_length

// MARK: - Strings

// swiftlint:disable explicit_type_interface function_parameter_count identifier_name line_length
// swiftlint:disable nesting type_body_length type_name
internal enum L10n {

  internal enum Common {
    internal enum Button {
      /// Cancel
      internal static let cancel = L10n.tr("Localizable", "common.button.cancel")
      /// No
      internal static let no = L10n.tr("Localizable", "common.button.no")
      /// OK
      internal static let ok = L10n.tr("Localizable", "common.button.ok")
      /// Save
      internal static let save = L10n.tr("Localizable", "common.button.save")
      /// Yes
      internal static let yes = L10n.tr("Localizable", "common.button.yes")
    }
    internal enum Message {
      /// Error: %@
      internal static func error(_ p1: String) -> String {
        return L10n.tr("Localizable", "common.message.error", p1)
      }
      /// Loading...
      internal static let loading = L10n.tr("Localizable", "common.message.loading")
      /// Tap to refresh...
      internal static let tapToRefresh = L10n.tr("Localizable", "common.message.tap-to-refresh")
    }
  }

  internal enum Example {
    internal enum Stuff {
      /// %ld items
      internal static func items(_ p1: Int) -> String {
        return L10n.tr("Localizable", "example.stuff.items", p1)
      }
    }
  }

  internal enum Login {
    internal enum Button {
      /// Sign-in
      internal static let signIn = L10n.tr("Localizable", "login.button.sign-in")
    }
    internal enum Message {
      /// Logging in...
      internal static let loggingIn = L10n.tr("Localizable", "login.message.logging-in")
    }
  }
}
// swiftlint:enable explicit_type_interface function_parameter_count identifier_name line_length
// swiftlint:enable nesting type_body_length type_name

// MARK: - Implementation Details

extension L10n {
  private static func tr(_ table: String, _ key: String, _ args: CVarArg...) -> String {
    let format = NSLocalizedString(key, tableName: table, bundle: Bundle(for: BundleToken.self), comment: "")
    return String(format: format, locale: Locale.current, arguments: args)
  }
}

private final class BundleToken {}
