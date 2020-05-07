//
//  SentryApplicationService.swift
//  Example Project
//
//  Created by David Jennes on 04/12/2017.
//  Copyright © 2019 Appwise. All rights reserved.
//

import AppwiseCore
import CocoaLumberjack
import Sentry

final class SentryApplicationService: NSObject, ApplicationService {
	// swiftlint:disable:next discouraged_optional_collection
	func application(_ application: UIApplication, willFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]? = nil) -> Bool {
		#if DEBUG
		#else
		SentrySDK.start(options: [
			"dsn": "https://<key>@sentry.io/<project>",
			"release": "example-project-ios@\(Config.shared.appVersion)",
			"enableAutoSessionTracking": true
		])

		SentrySDK.configureScope { scope in
			scope.setEnvironment(env(
				.dev("development"),
				.stg("staging"),
				.prd("production")
			))
		}
		#endif

		return true
	}
}
