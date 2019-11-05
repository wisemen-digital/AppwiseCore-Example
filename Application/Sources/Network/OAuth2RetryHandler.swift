//
//  OAuth2RetryHandler.swift
//  Example Project
//
//  Created by David Jennes on 20/03/2017.
//  Copyright © 2019 Appwise. All rights reserved.
//

import Alamofire
import p2_OAuth2

final class OAuth2RetryHandler: RequestRetrier, RequestAdapter {
	let loader: OAuth2DataLoader

	init(oauth2: OAuth2) {
		loader = OAuth2DataLoader(oauth2: oauth2)
	}

	/// Intercept 401 and do an OAuth2 authorization.
	func should(_ manager: SessionManager, retry request: Request, with error: Error, completion: @escaping RequestRetryCompletion) {
		guard let response = request.task?.response as? HTTPURLResponse,
			response.statusCode == 401,
			let req = request.request else {
			completion(false, 0.0)
			return
		}

		var dataRequest = OAuth2DataRequest(request: req) { _ in }
		dataRequest.context = completion
		loader.enqueue(request: dataRequest)
		loader.attemptToAuthorize { authParams, error in
			guard error != .alreadyAuthorizing else {
				// Don't dequeue requests if we are waiting for other authorization request
				return
			}

			self.loader.dequeueAndApply { req in
				if let comp = req.context as? RequestRetryCompletion {
					comp(authParams != nil, 0.0)
				}
			}

			// check if we actually have expired our session
			if let error = error, error.isSessionExpired {
				Notification.SessionExpired().post()
			}
		}
	}

	/// Sign the request with the access token.
	func adapt(_ urlRequest: URLRequest) throws -> URLRequest {
		guard loader.oauth2.accessToken != nil else {
			return urlRequest
		}
		return try urlRequest.signed(with: loader.oauth2)
	}
}

extension OAuth2Error {
	var isSessionExpired: Bool {
		switch self {
		case .accessDenied,
		     .forbidden,
		     .invalidGrant,
		     .invalidScope,
		     .noPasswordGrantDelegate,
		     .unauthorizedClient:
			return true
		case .generic,
		     .nsError,
		     .invalidURLComponents,
		     .noClientId,
		     .noClientSecret,
		     .noRedirectURL,
		     .noUsername,
		     .noPassword,
		     .alreadyAuthorizing,
		     .noAuthorizationContext,
		     .invalidAuthorizationContext,
		     .invalidRedirectURL,
		     .noAccessToken,
		     .noRefreshToken,
		     .noRegistrationURL,
		     .invalidLoginController,
		     .notUsingTLS,
		     .unableToOpenAuthorizeURL,
		     .invalidRequest,
		     .requestCancelled,
		     .noTokenType,
		     .unsupportedTokenType,
		     .noDataInResponse,
		     .prerequisiteFailed,
		     .missingState,
		     .invalidState,
		     .jsonParserError,
		     .utf8EncodeError,
		     .utf8DecodeError,
		     .wrongUsernamePassword,
		     .unsupportedResponseType,
		     .serverError,
		     .temporarilyUnavailable,
		     .responseError:
			return false
		}
	}
}
