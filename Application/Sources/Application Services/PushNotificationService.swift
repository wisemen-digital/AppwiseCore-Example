//
// Example Project
// Copyright © 2024 Wisemen
//

import AppwiseCore
import CocoaLumberjack
import OneSignalFramework

final class PushNotificationsApplicationService: NSObject, ApplicationService {
	let oneSignalAppId = env(
		.dev("..."),
		.tst("..."),
		.stg("..."),
		.prd("...")
	)

	// swiftlint:disable:next discouraged_optional_collection
	func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]? = nil) -> Bool {
		OneSignal.initialize(oneSignalAppId, withLaunchOptions: launchOptions)

		OneSignal.User.pushSubscription.addObserver(self)
		OneSignal.Notifications.addForegroundLifecycleListener(self)
		OneSignal.Notifications.addClickListener(self)

		return true
	}

	func applicationDidBecomeActive(_ application: UIApplication) {
		application.applicationIconBadgeNumber = 0
	}
}

extension PushNotificationsApplicationService: OSPushSubscriptionObserver {
	func onPushSubscriptionDidChange(state: OneSignalUser.OSPushSubscriptionChangedState) {
		guard state.current.token != nil else { return }
		PushNotificationsApplicationService.login()
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

extension PushNotificationsApplicationService: OSNotificationLifecycleListener, OSNotificationClickListener {
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
