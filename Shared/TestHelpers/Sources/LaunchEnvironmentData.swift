//
// Example Project
// Copyright © 2023 Wisemen
//

import Foundation

@dynamicMemberLookup
public struct LaunchEnvironmentData {
	public private(set) var data: [String: String] = [:]

	public static var current: Self {
		.init(data: ProcessInfo.processInfo.environment)
	}

	public init(data: [String: String] = [:]) {
		self.data = data
	}
}

public extension LaunchEnvironmentData {
	subscript(dynamicMember member: String) -> String? {
		get { data[member] }
		set { data[member] = newValue }
	}

	// swiftlint:disable:next discouraged_optional_boolean
	subscript(dynamicMember member: String) -> Bool? {
		get { data[member].flatMap { Bool($0) } }
		set { data[member] = newValue?.description }
	}

	subscript(dynamicMember member: String) -> Double? {
		get { data[member].flatMap { Double($0) } }
		set { data[member] = newValue.flatMap { String($0) } }
	}

	subscript(dynamicMember member: String) -> Int? {
		get { data[member].flatMap { Int($0) } }
		set { data[member] = newValue.flatMap { String($0) } }
	}

	subscript(dynamicMember member: String) -> Date? {
		get { self[dynamicMember: member].flatMap { Date(timeIntervalSince1970: $0) } }
		set { self[dynamicMember: member] = newValue?.timeIntervalSince1970 }
	}
}

public extension LaunchEnvironmentData {
	func string(_ key: String) -> String? {
		#if DEBUG
		return data[key]
		#else
		return nil
		#endif
	}

	// swiftlint:disable:next discouraged_optional_boolean
	func bool(_ key: String) -> Bool? {
		string(key).flatMap { .init($0) }
	}

	func integer(_ key: String) -> Int? {
		string(key).flatMap { .init($0) }
	}

	func double(_ key: String) -> Double? {
		string(key).flatMap { .init($0) }
	}

	func date(_ key: String) -> Date? {
		double(key).map { .init(timeIntervalSince1970: $0) }
	}
}

public extension LaunchEnvironmentData {
	func string(_ key: Key) -> String? {
		string(key.rawValue)
	}

	func bool(_ key: Key, defaultValue: Bool = false) -> Bool {
		bool(key.rawValue) ?? defaultValue
	}

	func integer(_ key: Key) -> Int? {
		integer(key.rawValue)
	}

	func double(_ key: Key) -> Double? {
		double(key.rawValue)
	}

	func date(_ key: Key) -> Date? {
		date(key.rawValue)
	}
}

public extension LaunchEnvironmentData {
	enum Key: String {
		case resetData = "reset_data"
	}
}
