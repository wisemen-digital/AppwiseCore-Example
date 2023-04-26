//
// Example Project
// Copyright © 2023 Wisemen
//

import Alamofire
import AppwiseCore

extension APIClient {
	func user(then handler: @escaping (Result<User, Error>) -> Void) {
		requestInsert(.user, of: User.self, then: handler)
	}
}
