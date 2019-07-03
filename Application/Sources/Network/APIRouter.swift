//
//  APIRouter.swift
//  Example Project
//
//  Created by David Jennes on 06/03/2017.
//  Copyright © 2019 Appwise. All rights reserved.
//

import Alamofire
import AppwiseCore

enum APIRouter: AppwiseCore.Router {
	static var baseURLString = env(
		.dev("https://test.com/api"),
		.stg("https://test.com/api"),
		.prd("https://test.com/api")
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
