//
// Example Project
// Copyright © 2024 Wisemen
//

import AppwiseCore
import UIKit

final class LoginViewController: UIViewController {
	override func viewDidLoad() {
		super.viewDidLoad()

		#if DEBUG
		// pre-set some credentials
		#endif
	}

	override var preferredStatusBarStyle: UIStatusBarStyle {
		.lightContent
	}
}

// MARK: - Actions

extension LoginViewController {
	@IBAction private func login(_: UIButton) {
		APIClient.shared.loginAndLoadUser(email: "foo", password: "bar") { [weak self] result in
			switch result {
			case .success:
				self?.perform(segue: StoryboardSegue.Authentication.finishedLogin)
			case .failure(let error):
				self?.present(error: error)
			}
		}
	}
}
