//
// Example Project
// Copyright © 2026 Wisemen
//

import AppwiseCore
import StatefulUI

struct StyleObserver: ApplicationLifecycleObserver {
	func application(_: UIApplication, willFinishLaunchingWithOptions _: [UIApplication.LaunchOptionsKey: Any]) -> Bool {
		UINavigationBar.appearance(whenContainedInInstancesOf: [NavigationController.self]).do {
			let appearance = UINavigationBarAppearance().then {
				$0.backgroundColor = Asset.Style.background.color
				$0.shadowColor = .clear
			}

			$0.standardAppearance = appearance
			$0.compactAppearance = appearance
			$0.scrollEdgeAppearance = appearance

			$0.barStyle = .black
			$0.isTranslucent = false
		}

		StateEmptyView.appearance().do {
			$0.titleColor = .white
			$0.subtitleColor = .white
			$0.buttonBackgroundColor = Asset.Style.secondary.color
			$0.tintColor = .white
		}

		StateErrorView.appearance().do {
			$0.titleColor = .white
			$0.subtitleColor = .white
			$0.buttonBackgroundColor = Asset.Style.secondary.color
			$0.tintColor = .white
		}

		StateLoadingView.appearance().do {
			$0.activityIndicatorColor = .white
			$0.titleColor = .white
			$0.subtitleColor = .white
			$0.tintColor = .white
		}

		return true
	}
}
