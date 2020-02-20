//
//  Settings.swift
//  Example Project
//
//  Created by David Jennes on 18/05/2017.
//  Copyright © 2019 Appwise. All rights reserved.
//

import AppwiseCore
import CoreData

extension Settings {
	private enum DefaultsKey: String {
		case currentUserID
		case walkthrough
	}
}

// Current stuff

extension Settings {
	mutating func logout() {
		currentUserID = nil
		// reset user related stuff
	}

	var currentUserID: User.ID? {
		get {
			guard let value = defaults.object(forKey: DefaultsKey.currentUserID.rawValue) as? Int else { return nil }
			return User.ID(Int64(value))
		}
		set {
			defaults.set(newValue?.rawValue, forKey: DefaultsKey.currentUserID.rawValue)
		}
	}
}

// MARK: - Others

extension Settings {
	var walkthrough: Bool {
		get {
			defaults.bool(forKey: userScoped(key: .walkthrough))
		}
		set {
			defaults.set(newValue, forKey: userScoped(key: .walkthrough))
		}
	}
}

extension Settings {
	private func userScoped(key: DefaultsKey) -> String {
		"\(key.rawValue)_\(currentUserID ?? 0)"
	}
}
