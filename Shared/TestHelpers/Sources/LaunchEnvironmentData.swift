//
// Example Project
// Copyright © 2023 Wisemen
//

import UIKit

public enum LaunchEnvironmentData {
	public static func string(_ key: Key) -> String? {
		#if DEBUG
		return ProcessInfo.processInfo.environment[key.rawValue]
		#else
		return nil
		#endif
	}

	public static func bool(_ key: Key, default defaultValue: Bool) -> Bool {
		#if DEBUG
		return string(key).flatMap { Bool($0) } ?? defaultValue
		#else
		return defaultValue
		#endif
	}
}

public extension LaunchEnvironmentData {
	enum Key: String {
		case resetData = "reset_data"
	}
}
