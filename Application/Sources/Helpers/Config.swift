//
// Example Project
// Copyright © 2023 Wisemen
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

	func handleUpdate(from old: Version, to new: Version) {
		// upgrade between versions
	}
}
