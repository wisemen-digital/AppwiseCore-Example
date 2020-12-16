//
// Example Project
// Copyright © 2020 Appwise
//

import Alamofire
import AppwiseCore

enum APIRouter: AppwiseCore.Router {
	static var baseURLString = env(
		.dev("https://test.development.appwi.se/api/"),
		.stg("https://test.staging.appwi.se/api/"),
		.prd("https://test.production.appwi.se/api/")
	)

	case user
	case tester(user: User.ID)
}

extension APIRouter {
	var path: String {
		switch self {
		case .user:
			return "user/me"
		case .tester(let userID):
			return "tester/\(userID)"
		}
	}

	var method: HTTPMethod {
		switch self {
		case .tester:
			return .post
		default:
			return .get
		}
	}

	var params: Parameters? {
		switch self {
		case .tester:
			return [
				"test": 1
			]
		default:
			return nil
		}
	}
}
