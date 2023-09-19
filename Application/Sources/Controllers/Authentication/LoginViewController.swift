//
// Example Project
// Copyright © 2023 Wisemen
//

import AppwiseCore
import TestHelpers
import UIKit

final class LoginViewController: UIViewController {
	@IBOutlet private var loginButton: UIButton!

	override var preferredStatusBarStyle: UIStatusBarStyle {
		.lightContent
	}

	override func viewDidLoad() {
		super.viewDidLoad()

		loginButton.accessibilityIdentifier = AccessibilityIdentifiers.loginButton

		#if DEBUG
		// pre-set some credentials
		#endif
	}
}

// MARK: - Actions

private extension LoginViewController {
	@IBAction func login(_ sender: UIButton) {
		APIClient.shared.loginAndLoadUser(email: "foo", password: "bar") { [weak self] result in
			switch result {
			case .success(let user):
				Settings.shared.currentUserID = user.id
				self?.perform(segue: StoryboardSegue.Authentication.finishedLogin)
			case .failure(let error):
				self?.present(error: error)
			}
		}
	}
}
