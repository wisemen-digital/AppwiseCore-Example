//
// Example Project
// Copyright © 2026 Wisemen
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
