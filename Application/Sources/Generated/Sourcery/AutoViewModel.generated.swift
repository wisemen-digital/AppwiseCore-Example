// Generated using Sourcery 0.16.1 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT

import AppwiseCore

// MARK: - ViewModel.User

extension ViewModel.User {
	init(_ data: Model.User) {
		self.data = data
	}

	var id: User.ID {
		return data.id
	}
}

