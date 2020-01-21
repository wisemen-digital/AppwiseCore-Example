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
		do {
			Sentry.Client.shared = try Sentry.Client(dsn: "https://<key>@sentry.io/<project>").then {
				$0.environment = env(
					.dev("development"),
					.stg("staging"),
					.prd("production")
				)
				#if DEBUG
				$0.tags = ["debug": "yes"]
				#else
				$0.tags = ["debug": "no"]
				#endif
				$0.releaseName = "example-project-ios@\(Config.shared.appVersion)"
				$0.trackMemoryPressureAsEvent()
				$0.enableAutomaticBreadcrumbTracking()
			}

			try Sentry.Client.shared?.startCrashHandler()
		} catch {
			DDLogError("\(error)")
		}

		return true
	}
}
