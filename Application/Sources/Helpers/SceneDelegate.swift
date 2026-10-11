//
// Example Project
// Copyright © 2026 Wisemen
//

import AppwiseCore
import UIKit

/// The scene delegate for the example application.
/// This handles scene-level lifecycle events and coordinates with the AppDelegate.
final class SceneDelegate: AppwiseCore.SceneDelegate {
	/// The list of scene services for this example
	override var plugins: [SceneDelegatePlugin] {
		[
            RemoteNotificationObserver()
		]
	}
}
