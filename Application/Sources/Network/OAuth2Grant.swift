//
// Example Project
// Copyright © 2024 Wisemen
//

import p2_OAuth2

enum OAuth2Grant {
	static let grant = OAuth2PasswordGrant(settings: env(
		.dev([
			"client_id": "",
			"client_secret": "",
			"token_uri": "https://test.development.appwi.se/oauth/token"
		]),
		.tst([
			"client_id": "",
			"client_secret": "",
			"token_uri": "https://test.test.appwi.se/oauth/token"
		]),
		.stg([
			"client_id": "",
			"client_secret": "",
			"token_uri": "https://test.staging.appwi.se/oauth/token"
		]),
		.prd([
			"client_id": "",
			"client_secret": "",
			"token_uri": "https://test.production.appwi.se/oauth/token"
		])
	))
		.then { grant in
			grant.clientConfig.secretInBody = false
			#if DEBUG
			grant.logger = OAuth2DebugLogger(.trace)

			Self.loadTokensFromEnvironment(into: grant)
			#endif
		}

	static var haveValidCredentials: Bool {
		grant.refreshToken != nil
	}

	private static func loadTokensFromEnvironment(into grant: OAuth2Base) {
		guard let token = TestData.string(.refreshToken) else { return }
		grant.refreshToken = token
	}
}
