// Generated using Sourcery 0.14.0 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT

import Foundation

// MARK: - UserViewModel

extension UserViewModel {
	init(_ data: User) {
		self.data = data
	}

	var id: Int64 {
		return data.id
	}
}

