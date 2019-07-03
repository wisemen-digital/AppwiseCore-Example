//
//  NetworkDebugApplicationService.swift
//  Example Project
//
//  Created by David Jennes on 02/07/2019.
//  Copyright © 2019 Appwise. All rights reserved.
//

import AppwiseCore
#if DEBUG
import Bagel
#endif

final class NetworkDebugApplicationService: NSObject, ApplicationService {
	// swiftlint:disable:next discouraged_optional_collection
	func application(_ application: UIApplication, willFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]? = nil) -> Bool {
		#if DEBUG
		let suffix = env(
			.dev(" - Development"),
			.stg(" - Staging"),
			.prd("")
		)
		let configuration = BagelConfiguration.default().then {
			$0.project.projectName += suffix
		}

		Bagel.start(configuration)
		#endif

		return true
	}
}
