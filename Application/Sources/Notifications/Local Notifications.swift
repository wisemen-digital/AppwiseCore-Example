//
//  Local Notifications.swift
//  Example Project
//
//  Created by David Jennes on 02/07/2019.
//  Copyright © 2019 Appwise. All rights reserved.
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
