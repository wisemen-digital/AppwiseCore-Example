//
//  Config.swift
//  Example Project
//
//  Created by David Jennes on 17/09/16.
//  Copyright © 2019 Appwise. All rights reserved.
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
