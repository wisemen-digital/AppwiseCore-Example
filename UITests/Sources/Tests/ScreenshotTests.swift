//
// Example Project
// Copyright © 2023 Wisemen
//

import TestHelpers
import XCTest

final class ScreenshotTests: XCTestCase {
	private enum Screens {
		static let login = "Login"
		static let orangeTab = "Orange tab"
		static let blueTab = "BlueTab"
	}

	private func login() throws -> XCUIApplication {
		var options = LaunchEnvironmentData()
		options.resetData = true

		let app = AppHelper.startFastlaneScreenshots(launchOptions: options)
		let loginButton = try app.fetchAndWaitFor(\.buttons, identifier: AccessibilityIdentifiers.loginButton)

		XCTContext.runActivity(named: Screens.login) { activity in
			activity.attachScreenshot(withFastlane: true)
		}

		loginButton.tap()

		return app
	}

    func testScreenshots() throws {
		let app = try login()
		let tabBar = try app.fetchAndWaitFor(\.tabBars)

		XCTContext.runActivity(named: Screens.orangeTab) { activity in
			tabBar.buttons.element(boundBy: 0).tap()
			activity.attachScreenshot(withFastlane: true)
		}

		XCTContext.runActivity(named: Screens.blueTab) { activity in
			tabBar.buttons.element(boundBy: 1).tap()
			activity.attachScreenshot(withFastlane: true)
		}
    }
}
