//
// Example Project
// Copyright © 2023 Wisemen
//

import Foundation
import TestHelpers
import XCTest

enum AppHelper {
	static func start(launchOptions: LaunchEnvironmentData = .default) -> XCUIApplication {
		let app = XCUIApplication()
		app.launchEnvironment = launchOptions.data
		app.launch()

		return app
	}

	static func startFastlaneScreenshots(launchOptions: LaunchEnvironmentData = .default, waitForAnimations: Bool = false) -> XCUIApplication {
		let app = XCUIApplication()
		app.launchEnvironment = launchOptions.data

		setupSnapshot(app, waitForAnimations: waitForAnimations)

		app.launch()

		return app
	}
}
