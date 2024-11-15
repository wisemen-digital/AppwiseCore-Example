//
// Example Project
// Copyright © 2024 Wisemen
//

import AppwiseCore
import IQKeyboardManagerSwift

final class KeyboardManagerApplicationService: NSObject, ApplicationService {
	// swiftlint:disable:next discouraged_optional_collection
	func application(_: UIApplication, didFinishLaunchingWithOptions _: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
		IQKeyboardManager.shared.isEnabled = false

		// only enable for specific screens
		IQKeyboardManager.shared.enabledDistanceHandlingClasses.append(contentsOf: [
			MainViewController.self
		])

		return true
	}
}
