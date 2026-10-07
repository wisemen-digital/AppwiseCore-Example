//
// Example Project
// Copyright © 2026 Wisemen
//

import AppwiseCore

struct Config: AppwiseCore.Config {
	static let shared = Self()

	func initialize() {
		// do some init stuff
	}

	func teardownForReset() {
		// do some reset stuff
		OAuth2Grant.grant.forgetTokens()
	}

	func handleUpdate(from _: Version, to _: Version) {
		// upgrade between versions
	}
}
