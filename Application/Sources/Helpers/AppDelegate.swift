//
// Example Project
// Copyright © 2026 Wisemen
//

import AppwiseCore

@UIApplicationMain
final class AppDelegate: AppwiseCore.AppDelegate<Config, SceneDelegate> {
	override var plugins: [ApplicationDelegatePlugin] {
		[
			SentryObserver(),
			CoreDataObserver(),
			KeyboardManagerObserver(),
			NetworkDebugObserver(),
			StyleObserver(),
			RemoteNotificationObserver()
		]
	}
}
