//
// Example Project
// Copyright © 2026 Wisemen
//

import AppwiseCore
import CocoaLumberjack
import OneSignalFramework

final class RemoteNotificationObserver: NSObject {
	let oneSignalAppId = env(
		.dev("..."),
		.tst("..."),
		.stg("..."),
		.prd("...")
	)
}

extension RemoteNotificationObserver: ApplicationLifecycleObserver {
	func application(_: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]) -> Bool {
		OneSignal.initialize(oneSignalAppId, withLaunchOptions: launchOptions)

		OneSignal.User.pushSubscription.addObserver(self)
		OneSignal.Notifications.addForegroundLifecycleListener(self)
		OneSignal.Notifications.addClickListener(self)

		return true
	}
}

extension RemoteNotificationObserver: SceneLifecycleObserver {
	func sceneDidBecomeActive(_: UIScene) {
		Task {
			if #available(iOS 16.0, *) {
				try? await UNUserNotificationCenter.current().setBadgeCount(0)
			} else {
				UIApplication.shared.applicationIconBadgeNumber = 0
			}
		}
	}
}

extension RemoteNotificationObserver: OSPushSubscriptionObserver {
	func onPushSubscriptionDidChange(state: OneSignalUser.OSPushSubscriptionChangedState) {
		guard state.current.token != nil else { return }
		Self.login()
	}

	static func login() {
		guard let userID = Settings.shared.currentUserID else { return }
		OneSignal.login(String(describing: userID))
	}

	static func logout() {
		OneSignal.logout()
	}

	static func promptForPushNotifications() {
		OneSignal.Notifications.requestPermission { granted in
			guard granted else { return }
			login()
		}
	}
}

extension RemoteNotificationObserver: OSNotificationLifecycleListener, OSNotificationClickListener {
	func onWillDisplay(event: OSNotificationWillDisplayEvent) {
		let info = event.notification.rawPayload

		if let pushNotification = PushNotification.create(for: info) {
			// always try to handle push
			pushNotification.handle()

			// if not show, ensure no options are set
			if pushNotification.canShow {
				event.preventDefault()
			} else {
				event.notification.display()
			}
		} else {
			event.notification.display()
		}
	}

	func onClick(event: OSNotificationClickEvent) {
		let info = event.notification.rawPayload

		if let pushNotification = PushNotification.create(for: info) {
			pushNotification.open()
		}
	}
}
