//
// Example Project
// Copyright © 2024 Wisemen
//

import AppwiseCore
import Groot
import UIKit

final class CoreDataApplicationService: NSObject, ApplicationService {
	// swiftlint:disable:next discouraged_optional_collection
	func application(_: UIApplication, willFinishLaunchingWithOptions _: [UIApplication.LaunchOptionsKey: Any]? = nil) -> Bool {
		ValueTransformer.grt_setValueTransformer(withName: "date:timestamp", transform: Transformers.timestamp)
		ValueTransformer.grt_setValueTransformer(withName: "url", transform: Transformers.url)

		return true
	}
}

// swiftlint:disable:next one_declaration_per_file
enum CoreDataParser {
	static let date = ISO8601DateFormatter().then {
		$0.formatOptions = [.withFullDate, .withDashSeparatorInDate]
	}
}

// swiftlint:disable:next one_declaration_per_file
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
