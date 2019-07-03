//
//  StyleApplicationService.swift
//  Example Project
//
//  Created by David Jennes on 02/07/2019.
//  Copyright © 2019 Appwise. All rights reserved.
//

import AppwiseCore
import StatefulUI

final class StyleApplicationService: NSObject, ApplicationService {
	// swiftlint:disable:next discouraged_optional_collection
	func application(_ application: UIApplication, willFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]? = nil) -> Bool {
		UINavigationBar.appearance(whenContainedInInstancesOf: [NavigationController.self]).do {
			$0.barStyle = .black
			$0.barTintColor = Asset.Style.background.color
			$0.isTranslucent = false
			$0.shadowImage = UIImage()
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
