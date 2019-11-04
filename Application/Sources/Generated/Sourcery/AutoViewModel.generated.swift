// Generated using Sourcery 0.17.0 — https://github.com/krzysztofzablocki/Sourcery
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

