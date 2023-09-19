//
// Example Project
// Copyright © 2023 Wisemen
//

import XCTest

extension XCUIApplication {
	func fetchAndWaitFor(_ element: KeyPath<XCUIApplication, XCUIElementQuery>, identifier: String, timeout: TimeInterval = 5) throws -> XCUIElement {
		let item = self[keyPath: element][identifier]
		return try fetchAndWaitFor(item, timeout: timeout)
	}

	func fetchAndWaitFor(_ element: KeyPath<XCUIApplication, XCUIElementQuery>, timeout: TimeInterval = 5) throws -> XCUIElement {
		let item = self[keyPath: element].firstMatch
		return try fetchAndWaitFor(item, timeout: timeout)
	}

	func fetchAndWaitFor(_ identifier: String, timeout: TimeInterval = 5) throws -> XCUIElement {
		let item = descendants(matching: .any).matching(identifier: identifier).firstMatch
		return try fetchAndWaitFor(item, timeout: timeout)
	}

	func fetchAndWaitFor(_ element: XCUIElement, timeout: TimeInterval = 5) throws -> XCUIElement {
		let exists = element.waitForExistence(timeout: timeout)

		if exists {
			return element
		} else {
			throw ElementNotFound()
		}
	}
}

struct ElementNotFound: Error { }
