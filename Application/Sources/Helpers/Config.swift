//
// Example Project
// Copyright © 2020 Appwise
//

import AppwiseCore

struct Config: AppwiseCore.Config {
	static let shared = Config()

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
