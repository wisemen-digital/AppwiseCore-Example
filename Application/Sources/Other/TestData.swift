//
// Example Project
// Copyright © 2022 Appwise
//

import UIKit

enum TestData {
	enum Key: String {
		case disablePushes = "DisablePushes"
		case firstName = "FirstName"
		case lastName = "LastName"
		case personPlaceholderImage = "PersonPlaceholderImage"
		case refreshToken = "RefreshToken"
	}

	static func string(_ key: Key) -> String? {
		#if DEBUG
		return ProcessInfo.processInfo.environment[key.rawValue]
		#else
		return nil
		#endif
	}

	static func image(_ key: Key) -> UIImage? {
		#if DEBUG
		// swiftlint:disable:next swiftgen_assets
		return string(key).flatMap { UIImage(named: $0) }
		#else
		return nil
		#endif
	}

	static func bool(_ key: Key, default defaultValue: Bool) -> Bool {
		#if DEBUG
		return string(key).flatMap { $0 == "true" } ?? defaultValue
		#else
		return defaultValue
		#endif
	}
}
