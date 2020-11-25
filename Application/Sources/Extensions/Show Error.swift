//  // Example Project
// Copyright © 2020 Appwise //

import p2_OAuth2
import UIKit

extension UIViewController {
	func present(error: Error, title: String = Config.shared.appName) {
		let message = self.message(for: error)
		present(message: message, title: title)
	}

	func present(message: String, title: String = Config.shared.appName, tappedOK: @escaping () -> Void = {}) {
		let vc = UIAlertController(title: title, message: message, preferredStyle: .alert)

		vc.style()
		vc.addAction(UIAlertAction(title: L10n.Common.Button.ok, style: .default) { _ in
			tappedOK()
		})

		present(vc, animated: true)
	}

	private func message(for error: Error) -> String {
		switch error {
		case let error as OAuth2Error:
			return message(for: error)
		default:
			return error.localizedDescription
		}
	}

	private func message(for error: OAuth2Error) -> String {
		switch error {
		case .accessDenied(let message):
			return message ?? L10n.Authentication.Error.accessDenied
		case .forbidden:
			return L10n.Authentication.Error.forbidden
		case .temporarilyUnavailable(let message):
			return message ?? L10n.Authentication.Error.temporarilyUnavailable
		case .unauthorizedClient(let message):
			return message ?? L10n.Authentication.Error.unauthorizedClient
		case .wrongUsernamePassword:
			return L10n.Authentication.Error.wrongUsernamePassword
		default:
			return String(describing: error)
		}
	}
}
