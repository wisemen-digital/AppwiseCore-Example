//
// Example Project
// Copyright © 2023 Wisemen
//

import AppwiseCore
import CocoaLumberjack
import OneSignal

final class PushNotificationsApplicationService: NSObject, ApplicationService {
	let oneSignalAppId = env(
		.dev("..."),
		.tst("..."),
		.stg("..."),
		.prd("...")
	)

	// swiftlint:disable:next discouraged_optional_collection
	func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]? = nil) -> Bool {
		UNUserNotificationCenter.current().delegate = self

		OneSignal.initWithLaunchOptions(launchOptions)
		OneSignal.setAppId(oneSignalAppId)
		OneSignal.add(self)

		return true
	}

	func applicationDidBecomeActive(_ application: UIApplication) {
		application.applicationIconBadgeNumber = 0
	}
}

extension PushNotificationsApplicationService: OSSubscriptionObserver {
	func onOSSubscriptionChanged(_ stateChanges: OSSubscriptionStateChanges) {
		guard let token = stateChanges.to.pushToken else { return }
		DDLogInfo("Received APNS token: \(token)")

		Self.registerUser()
	}

	static func registerUser() {
		guard let userID = Settings.shared.currentUserID else { return }
		OneSignal.setExternalUserId(String(describing: userID))
	}

	static func anonimizeUser() {
		OneSignal.removeExternalUserId()
	}

	static func promptForPushNotifications() {
		OneSignal.promptForPushNotifications { granted in
			guard granted else { return }
			registerUser()
		}
	}
}

extension PushNotificationsApplicationService: UNUserNotificationCenterDelegate {
	func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
		let info = notification.request.content.userInfo

		if let pushNotification = PushNotification.create(for: info) {
			// always try to handle push
			pushNotification.handle()

			// if not show, ensure no options are set
			if !pushNotification.canShow {
				completionHandler([])
			} else {
				completionHandler([.list, .banner, .badge, .sound])
			}
		} else {
			completionHandler([.list, .banner, .badge, .sound])
		}
	}

	func userNotificationCenter(_ center: UNUserNotificationCenter, didReceive response: UNNotificationResponse, withCompletionHandler completionHandler: @escaping () -> Void) {
		let info = response.notification.request.content.userInfo

		if let pushNotification = PushNotification.create(for: info) {
			pushNotification.open()
		}

		completionHandler()
	}
}
