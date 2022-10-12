// swiftlint:disable all
// Generated using SwiftGen — https://github.com/SwiftGen/SwiftGen

import Foundation

// swiftlint:disable superfluous_disable_command file_length implicit_return prefer_self_in_static_references

// MARK: - Strings

// swiftlint:disable explicit_type_interface function_parameter_count identifier_name line_length
// swiftlint:disable nesting type_body_length type_name vertical_whitespace_opening_braces
internal enum L10n {
  internal enum Authentication {
    internal enum Error {
      /// The resource owner or authorization server denied the request.
      internal static let accessDenied = L10n.tr("Localizable", "authentication.error.access-denied", fallback: "The resource owner or authorization server denied the request.")
      /// Forbidden.
      internal static let forbidden = L10n.tr("Localizable", "authentication.error.forbidden", fallback: "Forbidden.")
      /// The authorization server is currently unable to handle the request due to a temporary overloading or maintenance of the server.
      internal static let temporarilyUnavailable = L10n.tr("Localizable", "authentication.error.temporarily-unavailable", fallback: "The authorization server is currently unable to handle the request due to a temporary overloading or maintenance of the server.")
      /// Unauthorized.
      internal static let unauthorizedClient = L10n.tr("Localizable", "authentication.error.unauthorized-client", fallback: "Unauthorized.")
      /// The username or password is incorrect.
      internal static let wrongUsernamePassword = L10n.tr("Localizable", "authentication.error.wrong-username-password", fallback: "The username or password is incorrect.")
    }
  }
  internal enum Common {
    internal enum Button {
      /// Cancel
      internal static let cancel = L10n.tr("Localizable", "common.button.cancel", fallback: "Cancel")
      /// No
      internal static let no = L10n.tr("Localizable", "common.button.no", fallback: "No")
      /// OK
      internal static let ok = L10n.tr("Localizable", "common.button.ok", fallback: "OK")
      /// Save
      internal static let save = L10n.tr("Localizable", "common.button.save", fallback: "Save")
      /// Yes
      internal static let yes = L10n.tr("Localizable", "common.button.yes", fallback: "Yes")
    }
    internal enum Message {
      /// Error: %@
      internal static func error(_ p1: Any) -> String {
        return L10n.tr("Localizable", "common.message.error", String(describing: p1), fallback: "Error: %@")
      }
      /// Loading...
      internal static let loading = L10n.tr("Localizable", "common.message.loading", fallback: "Loading...")
      /// Tap to refresh...
      internal static let tapToRefresh = L10n.tr("Localizable", "common.message.tap-to-refresh", fallback: "Tap to refresh...")
    }
  }
  internal enum Example {
    internal enum Stuff {
      /// Plural format key: "%#@Items@"
      internal static func items(_ p1: Int) -> String {
        return L10n.tr("Localizable", "example.stuff.items", p1, fallback: "Plural format key: \"%#@Items@\"")
      }
    }
  }
  internal enum Login {
    internal enum Button {
      /// Sign-in
      internal static let signIn = L10n.tr("Localizable", "login.button.sign-in", fallback: "Sign-in")
    }
    internal enum Message {
      /// Logging in...
      internal static let loggingIn = L10n.tr("Localizable", "login.message.logging-in", fallback: "Logging in...")
    }
  }
}
// swiftlint:enable explicit_type_interface function_parameter_count identifier_name line_length
// swiftlint:enable nesting type_body_length type_name vertical_whitespace_opening_braces

// MARK: - Implementation Details

extension L10n {
  private static func tr(_ table: String, _ key: String, _ args: CVarArg..., fallback value: String) -> String {
    let format = BundleToken.bundle.localizedString(forKey: key, value: value, table: table)
    return String(format: format, locale: Locale.current, arguments: args)
  }
}

// swiftlint:disable convenience_type
private final class BundleToken {
  static let bundle: Bundle = {
    #if SWIFT_PACKAGE
    return Bundle.module
    #else
    return Bundle(for: BundleToken.self)
    #endif
  }()
}
// swiftlint:enable convenience_type
