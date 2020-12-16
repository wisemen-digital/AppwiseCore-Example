//
// Example Project
// Copyright © 2020 Appwise
//

import Alamofire
import AppwiseCore

extension APIClient {
	func user(then handler: @escaping (Result<User>) -> Void) {
		requestInsert(.user, type: User.self, then: handler)
	}
}
