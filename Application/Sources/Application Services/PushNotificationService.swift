//  // Example Project
// Copyright © 2020 Appwise //

import AppwiseCore
import CocoaLumberjack
import OneSignal

final class PushNotificationsApplicationService: NSObject, ApplicationService {
	let oneSignalAppId = env(
		.dev("..."),
		.stg("..."),
		.prd("...")
	)

	// swiftlint:disable discouraged_optional_collection
	func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]? = nil) -> Bool {
		UNUserNotificationCenter.current().delegate = self

		OneSignal.initWithLaunchOptions(launchOptions, appId: oneSignalAppId, handleNotificationReceived: receivedNotification, handleNotificationAction: openNotification, settings: [
			kOSSettingsKeyAutoPrompt: false,
			kOSSettingsKeyInFocusDisplayOption: OSNotificationDisplayType.notification.rawValue
		])
		OneSignal.add(self)

		return true
	}

	func applicationDidBecomeActive(_ application: UIApplication) {
		application.applicationIconBadgeNumber = 0
	}
}

extension PushNotificationsApplicationService: OSSubscriptionObserver {
	func onOSSubscriptionChanged(_ stateChanges: OSSubscriptionStateChanges!) {
		guard let token = stateChanges.to.pushToken else { return }
		DDLogInfo("Received APNS token: \(token)")

		PushNotificationsApplicationService.registerUser()
	}

	static func registerUser() {
		guard let userID = Settings.shared.currentUserID else { return }
		OneSignal.setExternalUserId(String(describing: userID))
	}

	static func anonimizeUser() {
		OneSignal.removeExternalUserId()
	}
}

private extension PushNotificationsApplicationService {
	func receivedNotification(_ notification: OSNotification?) {
		guard let data = notification?.payload.additionalData,
		      let pushNotification = PushNotification.create(for: data) else { return }

		pushNotification.handle()
	}

	func openNotification(_ result: OSNotificationOpenedResult?) {
		guard let data = result?.notification?.payload.additionalData,
		      let pushNotification = PushNotification.create(for: data) else { return }

		pushNotification.open()
	}
}

extension PushNotificationsApplicationService: UNUserNotificationCenterDelegate {
	func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
		guard let data = notification.request.content.userInfo["custom"] as? [String: Any],
		      let json = data["a"] as? [String: Any],
		      let pushNotification = PushNotification.create(for: json) else { return }

		if !pushNotification.canShow {
			completionHandler(.sound)
		}
	}
}
