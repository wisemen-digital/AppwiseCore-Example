// Generated using Sourcery 2.2.5 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import AppwiseCore

// swiftlint:disable all
// MARK: - ViewModel.User

extension ViewModel.User {
	init(_ data: Model.User) {
		self.data = data
	}

	var id: User.ID {
		return data.id
	}
}

// swiftlint:enable all
