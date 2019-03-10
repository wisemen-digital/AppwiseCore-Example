// Generated using Sourcery 0.15.0 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT

import AppwiseCore

enum ViewModels {
}

// MARK: - UserViewModel

extension UserViewModel {
	init(_ data: User) {
		self.data = data
	}

	var id: Int64 {
		return data.id
	}
}

