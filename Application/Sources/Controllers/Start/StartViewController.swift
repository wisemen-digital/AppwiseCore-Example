//
// Example Project
// Copyright © 2023 Wisemen
//

import AppwiseCore
import UIKit

final class StartViewController: UIViewController {
	override func viewDidAppear(_ animated: Bool) {
		super.viewDidAppear(animated)
		checkLogin()
	}

	override var preferredStatusBarStyle: UIStatusBarStyle {
		.lightContent
	}

	private func checkLogin() {
		checkCanSkipLogin { [weak self] canSkip in
			if canSkip {
				self?.perform(segue: StoryboardSegue.Start.openMain)
			} else {
				self?.logout()
				self?.perform(segue: StoryboardSegue.Start.openAuthentication)
			}
		}
	}
}

// MARK: - Actions

extension StartViewController {
	override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
		switch StoryboardSegue.Start(segue) {
		case .openAuthentication:
			segue.destination.presentationController?.delegate = self
		default:
			break
		}
	}

	@IBAction private func finishedLogin(_ sender: UIStoryboardSegue) {
		DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) { [weak self] in
			self?.checkLogin()
		}
	}

	@IBAction private func logout(_ sender: UIStoryboardSegue) {
		logout()
	}

	private func logout() {
		APIClient.shared.logout()
		Settings.shared.logout()
		PushNotificationsApplicationService.logout()
	}
}

extension StartViewController: UIAdaptivePresentationControllerDelegate {
	func presentationControllerDidDismiss(_ presentationController: UIPresentationController) {
		checkLogin()
	}
}

// MARK: - Helper methods

extension StartViewController {
	private func checkCanSkipLogin(then handler: @escaping (Bool) -> Void) {
		let currentUser = Repository.User.current()

		switch (OAuth2Grant.haveValidCredentials, currentUser) {
		case (true, let user?) where user.haveCompleteUser:
			handler(true)
		case (true, let user?):
			user.refresh { result in
				handler(result.isSuccess)
			}
		default:
			handler(false)
		}
	}
}
