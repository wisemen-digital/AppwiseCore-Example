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

		return true
	}
}
