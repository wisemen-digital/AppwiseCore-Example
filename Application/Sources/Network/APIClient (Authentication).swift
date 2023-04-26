//
// Example Project
// Copyright © 2023 Wisemen
//

import Alamofire
import AppwiseCore
import p2_OAuth2

extension APIClient {
	func loginAndLoadUser(email: String, password: String, then handler: @escaping (Result<User, Error>) -> Void) {
		login(email: email, password: password) { error in
			if let error {
				handler(.failure(error))
			} else {
				self.user(then: handler)
			}
		}
	}

	private func login(email: String, password: String, then handler: @escaping (OAuth2Error?) -> Void) {
		OAuth2Grant.grant.username = email
		OAuth2Grant.grant.password = password

		OAuth2Grant.grant.authorize { (_: OAuth2JSON?, error: OAuth2Error?) in
			OAuth2Grant.grant.username = nil
			OAuth2Grant.grant.password = nil
			handler(error)
		}
	}

	func logout() {
		OAuth2Grant.grant.forgetTokens()
	}
}
