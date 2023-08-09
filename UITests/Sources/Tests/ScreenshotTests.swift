//
// Example Project
// Copyright © 2023 Wisemen
//

import XCTest

final class ScreenshotTests: XCTestCase {
    func testScreenshots() throws {
        let app = XCUIApplication()
		setupSnapshot(app)
        app.launch()

		XCTContext.runActivity(named: "Test") { activity in
			activity.attachScreenshot()
		}
    }
}
