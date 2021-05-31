//
// Example Project
// Copyright © 2021 Appwise
//

import Alamofire
import AppwiseCore

extension APIClient {
	func user(then handler: @escaping (Result<User, Error>) -> Void) {
		requestInsert(.user, of: User.self, then: handler)
	}
}
