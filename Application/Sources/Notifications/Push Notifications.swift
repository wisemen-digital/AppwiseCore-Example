//
// Example Project
// Copyright © 2023 Wisemen
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
