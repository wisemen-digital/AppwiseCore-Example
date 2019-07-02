// Generated using Sourcery 0.16.1 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT

import AppwiseCore

enum ViewModels {
}

// MARK: - UserViewModel

extension UserViewModel {
	init(_ data: User) {
		self.data = data
	}

	var id: User.ID {
		return data.id
	}
}

