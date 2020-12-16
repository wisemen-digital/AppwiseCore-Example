//
// Example Project
// Copyright © 2020 Appwise
//

import AppwiseCore
import UIKit

final class MainViewController: UIViewController {
	override func viewDidLoad() {
		super.viewDidLoad()

		Notification.SessionExpired.register(observer: self, selector: #selector(sessionExpired))
	}

	override var preferredStatusBarStyle: UIStatusBarStyle {
		.lightContent
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
