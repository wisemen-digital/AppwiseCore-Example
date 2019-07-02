//
//  Push Notifications.swift
//  Example Project
//
//  Created by David Jennes on 02/07/2019.
//  Copyright © 2019 Appwise. All rights reserved.
//

import AppwiseCore

// MARK: - Handler factory

extension PushNotification {
	private enum Key {
		static let notificationType = "type"
		static let data = "data"
	}

	private static let types: [PushNotificationType.Type] = [
		NewsItem.self
	]

	static func create(for info: [AnyHashable: Any]) -> PushNotificationType? {
		guard let typeID = info[Key.notificationType] as? String,
			let type = types.first(where: { $0.typeIdentifiers.contains(typeID) }),
			let data = info[Key.data] as? [AnyHashable: Any] else { return nil }

		return type.init(type: typeID, data: data)
	}
}
