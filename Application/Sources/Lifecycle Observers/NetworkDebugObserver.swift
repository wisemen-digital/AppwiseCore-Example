//
// Example Project
// Copyright © 2026 Wisemen
//

import AppwiseCore
#if DEBUG && canImport(Atlantis)
import Atlantis
#endif

struct NetworkDebugObserver: ApplicationLifecycleObserver {
	func application(_: UIApplication, willFinishLaunchingWithOptions _: [UIApplication.LaunchOptionsKey: Any]) -> Bool {
		#if DEBUG && canImport(Atlantis)
		Atlantis.start()
		#endif

		return true
	}
}
