//
// Example Project
// Copyright © 2020 Appwise
//

import AppwiseCore
import IQKeyboardManagerSwift

final class KeyboardManagerApplicationService: NSObject, ApplicationService {
	// swiftlint:disable:next discouraged_optional_collection
	func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
		IQKeyboardManager.shared.enable = false

		// only enable for specific screens
		IQKeyboardManager.shared.enabledDistanceHandlingClasses.append(contentsOf: [
			MainViewController.self
		])

		return true
	}
}
