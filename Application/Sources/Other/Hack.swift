//
// Example Project
// Copyright © 2023 Wisemen
//

import UIKit

// Stuff that might break on any iOS version, but needed to fix some other
// broken things. ¯\_(ツ)_/¯

enum Hack {
	// MARK: - Example hack, remove this

	static func fixCrashInScrollToSection(completion: @escaping () -> Void) {
		DispatchQueue.main.asyncAfter(deadline: .now() + .milliseconds(5), execute: completion)
	}
}
