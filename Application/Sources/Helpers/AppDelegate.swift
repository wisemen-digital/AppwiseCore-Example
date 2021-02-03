//
// Example Project
// Copyright © 2021 Appwise
//

import AppwiseCore

@UIApplicationMain
final class AppDelegate: AppwiseCore.AppDelegate<Config> {
	override var services: [ApplicationService] {
		[
			SentryApplicationService(),
			CoreDataApplicationService(),
			KeyboardManagerApplicationService(),
			NetworkDebugApplicationService(),
			StyleApplicationService(),
			PushNotificationsApplicationService()
		]
	}
}
