//
// Example Project
// Copyright © 2023 Wisemen
//

import XCTest

extension XCTActivity {
	func attachScreenshot(withFastlane: Bool = false) {
		// attach screenshot
		let screenshot = XCUIScreen.main.screenshot()
		let attachment = XCTAttachment(screenshot: screenshot)
		attachment.lifetime = .keepAlways
		add(attachment)

		// fastlane snapshot
		if withFastlane {
			snapshot(name, waitForLoadingIndicator: false)
		}
	}
}
