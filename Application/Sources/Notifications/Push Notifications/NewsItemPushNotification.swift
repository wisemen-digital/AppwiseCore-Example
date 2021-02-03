//
// Example Project
// Copyright © 2021 Appwise
//

import AppwiseCore
import UIKit

extension PushNotification {
	struct NewsItem: PushNotificationType {
		static let typeIdentifiers = ["news.item.new"]

		private let data: [AnyHashable: Any]

		init?(type: String, data: [AnyHashable: Any]) {
			self.data = data
		}

		func handle() {
			// import news item from data if possible
		}

		func open() {
			guard let itemID = data["id"] as? Int else { return }

			// open a deep link to the given news item
			print("Open deeplink to \(itemID)")
		}
	}
}
