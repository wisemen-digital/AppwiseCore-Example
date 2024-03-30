//
// Example Project
// Copyright © 2024 Wisemen
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
