//
// Example Project
// Copyright © 2026 Wisemen
//

import AppwiseCore
import CocoaLumberjack
import Sentry

struct SentryObserver: ApplicationLifecycleObserver {
	func application(_: UIApplication, willFinishLaunchingWithOptions _: [UIApplication.LaunchOptionsKey: Any]) -> Bool {
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
