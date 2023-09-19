//
// Example Project
// Copyright © 2023 Wisemen
//

import TestHelpers
import XCTest

final class ScreenshotTests: XCTestCase {
    func testScreenshots() throws {
		let app = try login()
		let tabBar = try app.fetchAndWaitFor(\.tabBars)

		XCTContext.runActivity(named: "Orange tab") { activity in
			tabBar.buttons.element(boundBy: 0).tap()
			activity.attachScreenshot()
		}

		XCTContext.runActivity(named: "Blue tab") { activity in
			tabBar.buttons.element(boundBy: 1).tap()
			activity.attachScreenshot()
		}
    }

	private func login() throws -> XCUIApplication {
		let app = XCUIApplication()
		setupSnapshot(app)

		app.launchEnvironment = [LaunchEnvironmentData.Key.resetData.rawValue: true.description]
		app.launch()

		let loginButton = try app.fetchAndWaitFor(\.buttons, identifier: AccessibilityIdentifiers.loginButton)

		XCTContext.runActivity(named: "Authentication") { activity in
			activity.attachScreenshot()
		}

		loginButton.tap()

		return app
	}
}
