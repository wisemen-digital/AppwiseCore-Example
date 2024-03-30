//
// Example Project
// Copyright © 2024 Wisemen
//

import AppwiseCore
import CocoaLumberjack
import Sentry

final class SentryApplicationService: NSObject, ApplicationService {
	// swiftlint:disable:next discouraged_optional_collection
	func application(_ application: UIApplication, willFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]? = nil) -> Bool {
		#if DEBUG
		#else
		SentrySDK.start { options in
			options.dsn = "https://<key>@sentry.io/<project>"
			options.releaseName = "example-project-ios@\(Config.shared.appVersion)"
			options.environment = env(
				.dev("development"), .tst("test"), .stg("staging"), .prd("production")
			)
			options.tracesSampleRate = env(.dev(1.0), .tst(1.0), .stg(1.0), .prd(0.1))
		}
		#endif

		return true
	}
}
