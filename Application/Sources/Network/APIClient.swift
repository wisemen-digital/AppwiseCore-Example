//
//  APIClient.swift
//  Example Project
//
//  Created by David Jennes on 04/01/2017.
//  Copyright © 2019 Appwise. All rights reserved.
//

import Alamofire
import AppwiseCore
import CocoaLumberjack
import Nuke
import NukeAlamofirePlugin
import p2_OAuth2

final class APIClient: Client {
	typealias RouterType = APIRouter

	static let shared = APIClient()

	let oauth2 = OAuth2CodeGrant(settings: env(
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
	)).then {
		$0.authConfig.authorizeEmbedded = true
		$0.clientConfig.secretInBody = true
		#if DEBUG
		$0.logger = OAuth2DebugLogger(.trace)
		#endif
		}

	private(set) lazy var sessionManager: SessionManager = SessionManager().then {
		let retrier = OAuth2RetryHandler(oauth2: self.oauth2)
		$0.adapter = retrier
		$0.retrier = retrier
	}

	private(set) lazy var nuke: Nuke.ImagePipeline = Nuke.ImagePipeline {
		$0.dataLoader = NukeAlamofirePlugin.AlamofireDataLoader(manager: self.sessionManager)
	}

	func nukeOptions(placeholder: Image? = nil, transition: ImageLoadingOptions.Transition? = nil, failureImage: Image? = nil, failureImageTransition: ImageLoadingOptions.Transition? = nil, contentModes: ImageLoadingOptions.ContentModes? = nil) -> ImageLoadingOptions {
		var options = ImageLoadingOptions(placeholder: placeholder, transition: transition, failureImage: failureImage, failureImageTransition: failureImageTransition, contentModes: contentModes)
		options.pipeline = self.nuke
		return options
	}
}
