//
//  MainViewController.swift
//  Example Project
//
//  Created by David Jennes on 17/09/16.
//  Copyright © 2019 Appwise. All rights reserved.
//

import AppwiseCore
import UIKit

final class MainViewController: UIViewController {
	override func viewDidLoad() {
		super.viewDidLoad()

		Notification.SessionExpired.register(observer: self, selector: #selector(sessionExpired))
	}

	override var preferredStatusBarStyle: UIStatusBarStyle {
		return .lightContent
	}

	@objc
	func sessionExpired() {
		Notification.SessionExpired.unregister(observer: self)

		// Delay by 3 seconds to ensure most animations/loads have finished
		DispatchQueue.main.asyncAfter(deadline: .now() + 3) { [weak self] in
			self?.perform(segue: StoryboardSegue.Main.logOut)
		}
	}
}
