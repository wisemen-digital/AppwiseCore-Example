//
//  LoginViewController.swift
//  Example Project
//
//  Created by David Jennes on 05/11/2019.
//  Copyright © 2019 Appwise. All rights reserved.
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
		return .lightContent
	}
}

// MARK: - Actions

extension LoginViewController {
	@IBAction private func login(_ sender: UIButton) {
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
