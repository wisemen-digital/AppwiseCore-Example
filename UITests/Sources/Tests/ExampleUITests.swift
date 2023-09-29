//
// Example Project
// Copyright © 2023 Wisemen
//

import TestHelpers
import XCTest

final class UITests: XCTestCase {
	func testCanLogin() throws {
		var options = LaunchEnvironmentData()
		options.resetData = true

		let app = AppHelper.start(launchOptions: options)
		let loginButton = try app.fetchAndWaitFor(\.buttons, identifier: AccessibilityIdentifiers.loginButton)

		XCTAssert(loginButton.isEnabled && loginButton.isHittable)
	}
}
