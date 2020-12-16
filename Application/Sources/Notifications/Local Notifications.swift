//
// Example Project
// Copyright © 2020 Appwise
//

import AppwiseCore

enum Notification {
	// MARK: - Session

	struct SessionExpired: TypedNotification {
	}

	// MARK: - Other

	struct UserUpdated: TypedPayloadNotification {
		var payload: Model.User
	}
}
