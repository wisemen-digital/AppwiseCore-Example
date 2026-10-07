//
// Example Project
// Copyright © 2026 Wisemen
//

import AppwiseCore
import Groot
import UIKit

final class CoreDataApplicationService: NSObject, ApplicationService {
	// swiftlint:disable:next discouraged_optional_collection
	func application(_: UIApplication, willFinishLaunchingWithOptions _: [UIApplication.LaunchOptionsKey: Any]? = nil) -> Bool {
        // Note that these transforms don't change the data if it does not match the input type! So if the input expects a `String`,
        // but gets an `Int` instead, then it'll stay an `Int`, it will NOT become `nil`.
		ValueTransformer.setValueTransformer(withName: "date:timestamp", transform: Transformers.timestamp)
		ValueTransformer.setValueTransformer(withName: "url", transform: Transformers.url)

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
	static func timestamp(_ data: TimeInterval) -> Any? {
		Date(timeIntervalSince1970: data)
	}

	static func url(_ data: String) -> Any? {
		URL(string: data)
	}
}
