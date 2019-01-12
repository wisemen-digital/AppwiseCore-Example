//
//  KeyboardManagerApplicationService.swift
//  Example Project
//
//  Created by David Jennes on 04/12/2017.
//  Copyright © 2019 Appwise. All rights reserved.
//

import AppwiseCore
import IQKeyboardManagerSwift

final class KeyboardManagerApplicationService: NSObject, ApplicationService {
	// swiftlint:disable:next discouraged_optional_collection
	func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
		IQKeyboardManager.shared.enable = true

		return true
	}
}
