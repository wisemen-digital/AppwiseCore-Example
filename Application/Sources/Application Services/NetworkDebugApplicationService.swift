//
// Example Project
// Copyright © 2026 Wisemen
//

import AppwiseCore
#if DEBUG && canImport(Atlantis)
import Atlantis
#endif

final class NetworkDebugApplicationService: NSObject, ApplicationService {
	// swiftlint:disable:next discouraged_optional_collection
	func application(_: UIApplication, willFinishLaunchingWithOptions _: [UIApplication.LaunchOptionsKey: Any]? = nil) -> Bool {
		#if DEBUG && canImport(Atlantis)
		Atlantis.start()
		#endif

		return true
	}
}
