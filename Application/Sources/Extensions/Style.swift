//
//  Style.swift
//  Example Project
//
//  Created by David Jennes on 03/07/2019.
//  Copyright © 2019 Appwise. All rights reserved.
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
