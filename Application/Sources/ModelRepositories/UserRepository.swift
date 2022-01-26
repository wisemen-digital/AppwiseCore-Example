//
// Example Project
// Copyright © 2022 Appwise
//

import AppwiseCore
import CoreData

extension Repository {
	enum User {
		static func current(context: NSManagedObjectContext = DB.shared.view) -> Single? {
			Settings.shared.currentUserID.flatMap { Single(objectID: $0, context: context) }
		}

		struct Single: SingleObjectRepository {
			let objectID: Model.User.ID
			let context: NSManagedObjectContext

			func refresh(then handler: @escaping (Result<Model.User, Error>) -> Void) {
				// we only have a refresh call for the current user
				precondition(objectID == Settings.shared.currentUserID, "Trying to refresh a user that isn't the main user.")

				APIClient.shared.user { result in
					handler(result)

					// Notify listeners that we've updated the current user
					if let user = result.value {
						Notification.UserUpdated(payload: user).post()
					}
				}
			}

			var haveCompleteUser: Bool {
				// implement whatever check you need here
				object != nil
			}
		}
	}
}
