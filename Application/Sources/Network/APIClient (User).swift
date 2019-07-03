//
//  APIClient (User).swift
//  Example Project
//
//  Created by David Jennes on 03/07/2019.
//  Copyright © 2019 Appwise. All rights reserved.
//

import Alamofire
import AppwiseCore

extension APIClient {
	func user(then handler: @escaping (Result<User>) -> Void) {
		requestInsert(.user, type: User.self, then: handler)
	}
}
