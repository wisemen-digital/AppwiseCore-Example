//
// Example Project
// Copyright © 2024 Wisemen
//

import SafariServices
import UIKit

extension SFSafariViewController {
	func style() {
		preferredBarTintColor = Asset.Style.background.color
		preferredControlTintColor = Asset.Style.primary.color
	}
}

extension UIAlertController {
	func style() {
		view.tintColor = Asset.Style.background.color
	}
}
