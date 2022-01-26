//
// Example Project
// Copyright © 2022 Appwise
//

import Alamofire
import p2_OAuth2

extension OAuth2: AuthenticationCredential {
	public var requiresRefresh: Bool {
		!hasUnexpiredAccessToken()
	}
}

final class OAuth2Authenticator: Authenticator {
	func apply(_ credential: OAuth2, to urlRequest: inout URLRequest) {
		try? urlRequest.sign(with: credential)
	}

	func refresh(_ credential: OAuth2, for session: Session, completion: @escaping (Result<OAuth2, Error>) -> Void) {
		credential.authorize { _, error in
			if let error = error {
				completion(.failure(error))

				if error.isSessionExpired {
					Notification.SessionExpired().post()
				}
			} else {
				completion(.success(credential))
			}
		}
	}

	func didRequest(_ urlRequest: URLRequest, with response: HTTPURLResponse, failDueToAuthenticationError error: Error) -> Bool {
		response.statusCode == 401
	}

	func isRequest(_ urlRequest: URLRequest, authenticatedWith credential: OAuth2) -> Bool {
		urlRequest.headers["Authorization"] == credential.accessToken.flatMap { "Bearer \($0)" }
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
