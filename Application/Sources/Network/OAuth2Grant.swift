//
//  OAuth2Grant.swift
//  Example Project
//
//  Created by David Jennes on 03/07/2019.
//  Copyright © 2019 Appwise. All rights reserved.
//

import p2_OAuth2

enum OAuth2Grant {
	static let grant = OAuth2CodeGrant(settings: env(
		.dev([
			"client_id": "",
			"client_secret": "",
			"authorize_uri": "https://test.com/authorize",
			"token_uri": "https://test.com/token",
			"redirect_uris": ["https://test.com/authorization_callback"]
		]),
		.stg([
			"client_id": "",
			"client_secret": "",
			"authorize_uri": "https://test.com/authorize",
			"token_uri": "https://test.com/token",
			"redirect_uris": ["https://test.com/authorization_callback"]
		]),
		.prd([
			"client_id": "",
			"client_secret": "",
			"authorize_uri": "https://test.com/authorize",
			"token_uri": "https://test.com/token",
			"redirect_uris": ["https://test.com/authorization_callback"]
		])
	))
		.then {
			$0.authConfig.authorizeEmbedded = true
			$0.clientConfig.secretInBody = false
			#if DEBUG
			$0.logger = OAuth2DebugLogger(.trace)

			OAuth2Grant.loadTokensFromEnvironment(into: $0)
			#endif
		}

	static var haveValidCredentials: Bool {
		return grant.refreshToken != nil
	}

	private static func loadTokensFromEnvironment(into grant: OAuth2Base) {
		guard let token = TestData.string(.refreshToken) else { return }
		grant.refreshToken = token
	}
}
