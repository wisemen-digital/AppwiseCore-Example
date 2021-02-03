//
// Example Project
// Copyright © 2021 Appwise
//

import AppwiseCore
import StatefulUI

final class StyleApplicationService: NSObject, ApplicationService {
	// swiftlint:disable:next discouraged_optional_collection
	func application(_ application: UIApplication, willFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]? = nil) -> Bool {
		UINavigationBar.appearance(whenContainedInInstancesOf: [NavigationController.self]).do {
			if #available(iOS 13.0, *) {
				let appearance = UINavigationBarAppearance().then {
					$0.backgroundColor = Asset.Style.background.color
					$0.shadowColor = .clear
				}

				$0.standardAppearance = appearance
				$0.compactAppearance = appearance
				$0.scrollEdgeAppearance = appearance
			} else {
				$0.barTintColor = Asset.Style.background.color
				$0.shadowImage = UIImage()
			}

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
