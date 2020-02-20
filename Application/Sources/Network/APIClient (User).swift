//
// Example Project
// Copyright © 2021 Appwise
//

import Alamofire
import AppwiseCore

extension APIClient {
	func user(then handler: @escaping (Swift.Result<User, Error>) -> Void) {
		requestInsert(.user, type: User.self, then: handler)
	}
}
