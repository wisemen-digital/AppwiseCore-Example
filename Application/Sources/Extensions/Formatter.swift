//
// Example Project
// Copyright © 2021 Appwise
//

import Foundation

// MARK: - Date & Time

extension Formatter {
	static let date = DateFormatter().then {
		$0.dateStyle = .long
		$0.timeStyle = .none
	}

	static let time = DateFormatter().then {
		$0.dateStyle = .none
		$0.timeStyle = .short
	}

	static let dateAndTime = DateFormatter().then {
		$0.dateStyle = .long
		$0.timeStyle = .short
	}

	// MARK: Relative

	static let relativeDate = DateFormatter().then {
		$0.dateStyle = .long
		$0.timeStyle = .none
		$0.doesRelativeDateFormatting = true
	}

	static let relativeTime = DateFormatter().then {
		$0.dateStyle = .none
		$0.timeStyle = .short
		$0.doesRelativeDateFormatting = true
	}

	static let relativeDateAndTime = DateFormatter().then {
		$0.dateStyle = .long
		$0.timeStyle = .short
		$0.doesRelativeDateFormatting = true
	}
}

// MARK: - Interval

extension Formatter {
	static let interval = DateIntervalFormatter().then {
		$0.dateStyle = .long
		$0.timeStyle = .short
	}
}

// MARK: - Measurements

extension Formatter {
	static let age = DateComponentsFormatter().then {
		$0.allowedUnits = [.year]
		$0.unitsStyle = .full
	}

	static let distance = MeasurementFormatter().then {
		$0.numberFormatter.maximumFractionDigits = 1
	}

	static let duration = DateComponentsFormatter().then {
		$0.allowedUnits = [.minute]
		$0.unitsStyle = .full
	}
}

// MARK: - Currency

extension Formatter {
	static let price = NumberFormatter().then {
		$0.numberStyle = .currency
		$0.currencyCode = "EUR"
		$0.currencySymbol = "€"
	}
}
