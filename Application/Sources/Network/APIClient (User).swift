//
// Example Project
// Copyright © 2024 Wisemen
//

import Alamofire
import AppwiseCore

extension APIClient {
	func user(then handler: @escaping (Result<User, Error>) -> Void) {
		requestInsert(.user, of: User.self, then: handler)
	}
}
