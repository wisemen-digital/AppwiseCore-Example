//
// Example Project
// Copyright © 2024 Wisemen
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
