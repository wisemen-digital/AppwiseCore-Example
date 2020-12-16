//
// Example Project
// Copyright © 2020 Appwise
//

import AppwiseCore
import Groot
import UIKit

final class CoreDataApplicationService: NSObject, ApplicationService {
	// swiftlint:disable discouraged_optional_collection
	func application(_ application: UIApplication, willFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]? = nil) -> Bool {
		ValueTransformer.grt_setValueTransformer(withName: "date:timestamp", transform: Transformers.timestamp)
		ValueTransformer.grt_setValueTransformer(withName: "url", transform: Transformers.url)

		return true
	}
}

enum CoreDataParser {
	static let date = ISO8601DateFormatter().then {
		$0.formatOptions = [.withFullDate, .withDashSeparatorInDate]
	}
}

private enum Transformers {
	static func timestamp(_ data: Any) -> Any? {
		guard let data = data as? TimeInterval else { return nil }

		return Date(timeIntervalSince1970: data)
	}

	static func url(_ data: Any) -> Any? {
		guard let data = data as? String else { return nil }

		return URL(string: data)
	}
}
